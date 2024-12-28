// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientDataImpl _$$ClientDataImplFromJson(Map<String, dynamic> json) =>
    _$ClientDataImpl(
      runId: (json['runId'] as num).toInt(),
      name: json['name'] as String,
      unit: json['unit'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      timestamp: (json['timestamp'] as num).toInt(),
    );

Map<String, dynamic> _$$ClientDataImplToJson(_$ClientDataImpl instance) =>
    <String, dynamic>{
      'runId': instance.runId,
      'name': instance.name,
      'unit': instance.unit,
      'values': instance.values,
      'timestamp': instance.timestamp,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$capModelHolderHash() => r'6ed298df7fe99c5509a1c308e89c11cccaa04b60';

/// See also [capModelHolder].
@ProviderFor(capModelHolder)
final capModelHolderProvider = AutoDisposeStreamProvider<
    Map<String, NetFieldCapture<(List<double>, DateTime)>>>.internal(
  capModelHolder,
  name: r'capModelHolderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$capModelHolderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CapModelHolderRef = AutoDisposeStreamProviderRef<
    Map<String, NetFieldCapture<(List<double>, DateTime)>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
