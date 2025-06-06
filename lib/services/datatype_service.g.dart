// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datatype_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublicDataType _$PublicDataTypeFromJson(Map<String, dynamic> json) =>
    _PublicDataType(
      name: json['name'] as String,
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$PublicDataTypeToJson(_PublicDataType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'unit': instance.unit,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDataTypesHash() => r'e2354d220097d7045dbb6f4fc5c65940e9753ad8';

/// See also [getDataTypes].
@ProviderFor(getDataTypes)
final getDataTypesProvider =
    AutoDisposeFutureProvider<List<PublicDataType>>.internal(
  getDataTypes,
  name: r'getDataTypesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDataTypesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetDataTypesRef = AutoDisposeFutureProviderRef<List<PublicDataType>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
