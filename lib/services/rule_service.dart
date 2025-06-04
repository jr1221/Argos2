import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../global_settings.dart';

part 'rule_service.freezed.dart';
part 'rule_service.g.dart';

/// A rule, as given from scylla
@freezed
class Rule with _$Rule {
  const factory Rule({
    required final String id,
    required final String topic,
    // ignore: non_constant_identifier_names
    required final int debounce_time,
    required final String expr,
  }) = _Rule;

  factory Rule.fromJson(final Map<String, Object?> json) =>
      _$RuleFromJson(json);
}

/// A rule notification
@freezed
class RuleNotification with _$RuleNotification {
  const factory RuleNotification({
    required final String id,
    required final String topic,
    required final List<double> values,
    required final DateTime time,
  }) = _RuleNotification;

  factory RuleNotification.fromJson(final Map<String, Object?> json) =>
      _$RuleNotificationFromJson(json);
}

@riverpod
class RuleNotificationsManager extends _$RuleNotificationsManager {
  List<RuleNotification> ruleNotifications = <RuleNotification>[];

  @override
  List<RuleNotification> build() => ruleNotifications;

  void addNotification(final RuleNotification ruleNotification) {
    // remove previous notification of same id
    ruleNotifications
      ..removeWhere(
        (final RuleNotification notif) => notif.id == ruleNotification.id,
      )
      ..add(ruleNotification);
    ref.notifyListeners();
  }

  void clearNotifications() {
    ruleNotifications.clear();
    ref.notifyListeners();
  }
}

@riverpod

/// Get the unique one-time generated client ID for the user
AsyncValue<String> ruleClientId(final Ref ref) {
  final AsyncValue<SharedPreferences> prefs =
      ref.watch(sharedPrefsInstanceProvider);
  switch (prefs) {
    case AsyncData<SharedPreferences>(:final SharedPreferences value):
      final String? clientId = value.getString(RULE_CLIENTID_KEY);
      if (clientId != null) {
        return AsyncValue<String>.data(clientId);
      } else {
        // create client ID for first time, a v1- (base64 of local-randDouble)
        final String clientIdNew =
            'v1-${base64Encode('${DateTime.now()}-${Random().nextDouble()}'.codeUnits)}';
        unawaited(value.setString(RULE_CLIENTID_KEY, clientIdNew));
        return AsyncValue<String>.data(clientIdNew);
      }
    case AsyncLoading<SharedPreferences>():
      return const AsyncValue<String>.loading();
    case AsyncError<SharedPreferences>(:final Object error):
      return AsyncValue<String>.error(error, StackTrace.current);
    default:
      return const AsyncValue<String>.loading();
  }
}

@riverpod
class RuleManager extends _$RuleManager {
  HashSet<Rule> rules = HashSet<Rule>();

  @override
  Future<HashSet<Rule>> build() async {
    final SharedPreferences? prefs =
        ref.watch(sharedPrefsInstanceProvider).value;
    if (prefs == null) return HashSet<Rule>();
    for (final String key in prefs
        .getKeys()
        .where((final String s) => s.startsWith(RULE_DATA_KEY_PREFIX))) {
      rules.add(Rule.fromJson(jsonDecode(prefs.getString(key) ?? '')));
    }

    // send all rules
    for (final Rule rule in rules) {
      await _sendRule(rule);
    }

    return rules;
  }

  Future<void> _sendRule(final Rule rule) async {
    final Uri conn = ref.read(connectionControlProvider).socketUri;
    final String clientId = ref.read(ruleClientIdProvider).value ?? 'test';
    final http.Response response = await http.put(
      Uri.parse('$conn/rules/add'),
      headers: <String, String>{
        HttpHeaders.authorizationHeader:
            'Basic ${base64Encode('$clientId:123'.codeUnits)}',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(rule.toJson()),
    );
    print(response.body);
  }

  Future<void> _sendDeleteRule(final String ruleId) async {
    final Uri conn = ref.read(connectionControlProvider).socketUri;
    final String clientId = ref.read(ruleClientIdProvider).value ?? 'test';
    await http.post(
      Uri.parse('$conn/rules/delete/$ruleId'),
      headers: <String, String>{
        HttpHeaders.authorizationHeader:
            'Basic ${base64Encode('$clientId:123'.codeUnits)}',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  Future<void> _writeRule(final Rule rule) async {
    final SharedPreferences? prefs =
        ref.read(sharedPrefsInstanceProvider).value;
    await prefs?.setString(
        '$RULE_DATA_KEY_PREFIX-${rule.id}', jsonEncode(rule.toJson()));
  }

  Future<void> _writeDeleteRule(final String ruleId) async {
    final SharedPreferences? prefs =
        ref.read(sharedPrefsInstanceProvider).value;
    await prefs?.remove('$RULE_DATA_KEY_PREFIX-$ruleId');
  }

  Future<void> registerRule(final Rule rule) async {
    rules.add(rule);
    await _sendRule(rule);
    await _writeRule(rule);

    state = AsyncData<HashSet<Rule>>(rules);
  }

  Future<void> deleteRule(final String ruleId) async {
    rules.removeWhere((final Rule rule) => rule.id == ruleId);
    await _sendDeleteRule(ruleId);
    await _writeDeleteRule(ruleId);

    state = AsyncData<HashSet<Rule>>(rules);
  }
}
