// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPrefsInstanceHash() =>
    r'de688d03c2a28b73a64d47913cf4a3e5d216d7a6';

/// See also [sharedPrefsInstance].
@ProviderFor(sharedPrefsInstance)
final sharedPrefsInstanceProvider =
    AutoDisposeFutureProvider<SharedPreferences>.internal(
  sharedPrefsInstance,
  name: r'sharedPrefsInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPrefsInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SharedPrefsInstanceRef
    = AutoDisposeFutureProviderRef<SharedPreferences>;
String _$connectionControlHash() => r'fd1a50e566c55214cfdaea7b91dfc306c913d065';

/// See also [ConnectionControl].
@ProviderFor(ConnectionControl)
final connectionControlProvider =
    AutoDisposeNotifierProvider<ConnectionControl, ConnectionProps>.internal(
  ConnectionControl.new,
  name: r'connectionControlProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectionControlHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConnectionControl = AutoDisposeNotifier<ConnectionProps>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
