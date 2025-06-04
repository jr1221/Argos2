// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RuleImpl _$$RuleImplFromJson(Map<String, dynamic> json) => _$RuleImpl(
      id: json['id'] as String,
      topic: json['topic'] as String,
      debounce_time: (json['debounce_time'] as num).toInt(),
      expr: json['expr'] as String,
    );

Map<String, dynamic> _$$RuleImplToJson(_$RuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'debounce_time': instance.debounce_time,
      'expr': instance.expr,
    };

_$RuleNotificationImpl _$$RuleNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$RuleNotificationImpl(
      id: json['id'] as String,
      topic: json['topic'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$RuleNotificationImplToJson(
        _$RuleNotificationImpl instance) =>
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
    r'e9ce5e41de4cffd4fe3662c26517da8ba8c0adf2';

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
String _$ruleManagerHash() => r'c232df8483aee3f5c040a853323ca259a6b0ca22';

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
