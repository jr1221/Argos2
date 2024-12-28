// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPrefsInstanceHash() =>
    r'8e004f7ec12c5daa17c051363822dbc49fe844ac';

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
String _$connectionControlHash() => r'00fde8d27b1e4a0380309d5029e25d687a1299ef';

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
String _$graphTopicsManagerHash() =>
    r'7a4b9c3c37956a131226086c48dbb5c76a2fe365';

/// See also [GraphTopicsManager].
@ProviderFor(GraphTopicsManager)
final graphTopicsManagerProvider = AutoDisposeNotifierProvider<
    GraphTopicsManager, HashSet<PublicDataType>>.internal(
  GraphTopicsManager.new,
  name: r'graphTopicsManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$graphTopicsManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GraphTopicsManager = AutoDisposeNotifier<HashSet<PublicDataType>>;
String _$historicalGraphRunManagerHash() =>
    r'89a24e746478f9a9d1b8379ef2e46808d272ea6b';

/// See also [HistoricalGraphRunManager].
@ProviderFor(HistoricalGraphRunManager)
final historicalGraphRunManagerProvider =
    AutoDisposeNotifierProvider<HistoricalGraphRunManager, int>.internal(
  HistoricalGraphRunManager.new,
  name: r'historicalGraphRunManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$historicalGraphRunManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HistoricalGraphRunManager = AutoDisposeNotifier<int>;
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
