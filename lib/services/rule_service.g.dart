// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RuleBackup _$RuleBackupFromJson(Map<String, dynamic> json) => _RuleBackup(
      version: (json['version'] as num).toInt(),
      clientId: json['clientId'] as String,
      rules: (json['rules'] as List<dynamic>)
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RuleBackupToJson(_RuleBackup instance) =>
    <String, dynamic>{
      'version': instance.version,
      'clientId': instance.clientId,
      'rules': instance.rules,
    };

_Rule _$RuleFromJson(Map<String, dynamic> json) => _Rule(
      id: json['id'] as String,
      topic: json['topic'] as String,
      debounce_time: (json['debounce_time'] as num).toInt(),
      expr: json['expr'] as String,
    );

Map<String, dynamic> _$RuleToJson(_Rule instance) => <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'debounce_time': instance.debounce_time,
      'expr': instance.expr,
    };

_RuleNotification _$RuleNotificationFromJson(Map<String, dynamic> json) =>
    _RuleNotification(
      id: json['id'] as String,
      topic: json['topic'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$RuleNotificationToJson(_RuleNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'values': instance.values,
      'time': instance.time.toIso8601String(),
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ruleClientIdHash() => r'671ca1e263d30d0c4198b8e2a819e820fe97ce74';

/// Get the unique one-time generated client ID for the user
///
/// Copied from [ruleClientId].
@ProviderFor(ruleClientId)
final ruleClientIdProvider = AutoDisposeProvider<AsyncValue<String>>.internal(
  ruleClientId,
  name: r'ruleClientIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ruleClientIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RuleClientIdRef = AutoDisposeProviderRef<AsyncValue<String>>;
String _$ruleNotificationsManagerHash() =>
    r'1f096d115c1ccfe3ae40eb6204fe3d0019867182';

/// See also [RuleNotificationsManager].
@ProviderFor(RuleNotificationsManager)
final ruleNotificationsManagerProvider = AutoDisposeNotifierProvider<
    RuleNotificationsManager, List<RuleNotification>>.internal(
  RuleNotificationsManager.new,
  name: r'ruleNotificationsManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ruleNotificationsManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RuleNotificationsManager
    = AutoDisposeNotifier<List<RuleNotification>>;
String _$ruleManagerHash() => r'542eafefb23475467302e910f82a57c7bb609f53';

/// See also [RuleManager].
@ProviderFor(RuleManager)
final ruleManagerProvider =
    AutoDisposeAsyncNotifierProvider<RuleManager, HashSet<Rule>>.internal(
  RuleManager.new,
  name: r'ruleManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ruleManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RuleManager = AutoDisposeAsyncNotifier<HashSet<Rule>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
