// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'argos_settings_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScyllaSettingsImpl _$$ScyllaSettingsImplFromJson(Map<String, dynamic> json) =>
    _$ScyllaSettingsImpl(
      data_upload_disabled: json['data_upload_disabled'] as bool,
      batch_upsert_time: (json['batch_upsert_time'] as num).toInt(),
      ratelimit_mode: (json['ratelimit_mode'] as num).toInt(),
      static_ratelimit_time: (json['static_ratelimit_time'] as num).toInt(),
      socket_discard_percent: (json['socket_discard_percent'] as num).toInt(),
    );

Map<String, dynamic> _$$ScyllaSettingsImplToJson(
        _$ScyllaSettingsImpl instance) =>
    <String, dynamic>{
      'data_upload_disabled': instance.data_upload_disabled,
      'batch_upsert_time': instance.batch_upsert_time,
      'ratelimit_mode': instance.ratelimit_mode,
      'static_ratelimit_time': instance.static_ratelimit_time,
      'socket_discard_percent': instance.socket_discard_percent,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSettingsHash() => r'31c1c254f79f7768ea0f5d72804b88c28d349388';

/// See also [getSettings].
@ProviderFor(getSettings)
final getSettingsProvider = AutoDisposeFutureProvider<ScyllaSettings>.internal(
  getSettings,
  name: r'getSettingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetSettingsRef = AutoDisposeFutureProviderRef<ScyllaSettings>;
String _$dataUploadDisableHash() => r'0f3feecf7622d383de66b393fbbe6842cbd624e2';

/// See also [DataUploadDisable].
@ProviderFor(DataUploadDisable)
final dataUploadDisableProvider =
    AutoDisposeAsyncNotifierProvider<DataUploadDisable, bool>.internal(
  DataUploadDisable.new,
  name: r'dataUploadDisableProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dataUploadDisableHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataUploadDisable = AutoDisposeAsyncNotifier<bool>;
String _$batchUpsertTimeHash() => r'e0d669c6688938fa3798aee48d541b2ad2245423';

/// See also [BatchUpsertTime].
@ProviderFor(BatchUpsertTime)
final batchUpsertTimeProvider =
    AutoDisposeAsyncNotifierProvider<BatchUpsertTime, int>.internal(
  BatchUpsertTime.new,
  name: r'batchUpsertTimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$batchUpsertTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BatchUpsertTime = AutoDisposeAsyncNotifier<int>;
String _$rateLimitModeSelectHash() =>
    r'c7fba2be681ec14ef41e2ae99dbf8c3067f66e72';

/// See also [RateLimitModeSelect].
@ProviderFor(RateLimitModeSelect)
final rateLimitModeSelectProvider = AutoDisposeAsyncNotifierProvider<
    RateLimitModeSelect, RateLimitMode>.internal(
  RateLimitModeSelect.new,
  name: r'rateLimitModeSelectProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rateLimitModeSelectHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RateLimitModeSelect = AutoDisposeAsyncNotifier<RateLimitMode>;
String _$staticRatelimitTimeHash() =>
    r'2bde1a505def7bdcb2a87239465f33fb692c45d1';

/// See also [StaticRatelimitTime].
@ProviderFor(StaticRatelimitTime)
final staticRatelimitTimeProvider =
    AutoDisposeAsyncNotifierProvider<StaticRatelimitTime, int>.internal(
  StaticRatelimitTime.new,
  name: r'staticRatelimitTimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$staticRatelimitTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StaticRatelimitTime = AutoDisposeAsyncNotifier<int>;
String _$socketDiscardPercentHash() =>
    r'f21aebdf314222e9ea16ed0dad57cb751f75ed58';

/// See also [SocketDiscardPercent].
@ProviderFor(SocketDiscardPercent)
final socketDiscardPercentProvider =
    AutoDisposeAsyncNotifierProvider<SocketDiscardPercent, int>.internal(
  SocketDiscardPercent.new,
  name: r'socketDiscardPercentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socketDiscardPercentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SocketDiscardPercent = AutoDisposeAsyncNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
