// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicRunImpl _$$PublicRunImplFromJson(Map<String, dynamic> json) =>
    _$PublicRunImpl(
      id: (json['id'] as num).toInt(),
      locationName: json['locationName'] as String,
      driverName: json['driverName'] as String,
      time: (json['time'] as num).toInt(),
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$PublicRunImplToJson(_$PublicRunImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locationName': instance.locationName,
      'driverName': instance.driverName,
      'time': instance.time,
      'notes': instance.notes,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$runHandlerHash() => r'658ba7a0a167b4d464da910cd4f1c3fee9acfcad';

/// handle the /runs endpoint
///
/// Copied from [RunHandler].
@ProviderFor(RunHandler)
final runHandlerProvider =
    AutoDisposeAsyncNotifierProvider<RunHandler, List<PublicRun>>.internal(
  RunHandler.new,
  name: r'runHandlerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$runHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RunHandler = AutoDisposeAsyncNotifier<List<PublicRun>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
