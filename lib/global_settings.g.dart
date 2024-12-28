// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPrefsInstanceHash() =>
    r'de688d03c2a28b73a64d47913cf4a3e5d216d7a6';

/// Get a shared preferences instance
///
/// Copied from [sharedPrefsInstance].
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
String _$favoriteTopicsManagerHash() =>
    r'507e017edf9fb00627dd769be9c9a71697676e66';

/// See also [FavoriteTopicsManager].
@ProviderFor(FavoriteTopicsManager)
final favoriteTopicsManagerProvider = AutoDisposeNotifierProvider<
    FavoriteTopicsManager, SplayTreeSet<String>>.internal(
  FavoriteTopicsManager.new,
  name: r'favoriteTopicsManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteTopicsManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoriteTopicsManager = AutoDisposeNotifier<SplayTreeSet<String>>;
String _$liveGraphSettingsManagerHash() =>
    r'245cf0a896df07bf2e5315da4893fbd2df719d28';

/// See also [LiveGraphSettingsManager].
@ProviderFor(LiveGraphSettingsManager)
final liveGraphSettingsManagerProvider =
    AutoDisposeNotifierProvider<LiveGraphSettingsManager, Duration>.internal(
  LiveGraphSettingsManager.new,
  name: r'liveGraphSettingsManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveGraphSettingsManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiveGraphSettingsManager = AutoDisposeNotifier<Duration>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
