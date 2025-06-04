// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardConfigImpl _$$DashboardConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardConfigImpl(
      topics:
          (json['topics'] as List<dynamic>).map((e) => e as String).toList(),
      crossAxisCount: (json['crossAxisCount'] as num).toInt(),
    );

Map<String, dynamic> _$$DashboardConfigImplToJson(
        _$DashboardConfigImpl instance) =>
    <String, dynamic>{
      'topics': instance.topics,
      'crossAxisCount': instance.crossAxisCount,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableDashboardsManagerHash() =>
    r'db0465f7e7ed583b2f39834b091e5dd64ee1cbf5';

/// See also [AvailableDashboardsManager].
@ProviderFor(AvailableDashboardsManager)
final availableDashboardsManagerProvider = AutoDisposeNotifierProvider<
    AvailableDashboardsManager, List<String>>.internal(
  AvailableDashboardsManager.new,
  name: r'availableDashboardsManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableDashboardsManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AvailableDashboardsManager = AutoDisposeNotifier<List<String>>;
String _$dashboardConfHash() => r'0c3165333ca68977b4288409c32eacfafecd6341';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DashboardConf
    extends BuildlessAutoDisposeNotifier<DashboardConfig> {
  late final String dashName;

  DashboardConfig build({
    required String dashName,
  });
}

/// See also [DashboardConf].
@ProviderFor(DashboardConf)
const dashboardConfProvider = DashboardConfFamily();

/// See also [DashboardConf].
class DashboardConfFamily extends Family<DashboardConfig> {
  /// See also [DashboardConf].
  const DashboardConfFamily();

  /// See also [DashboardConf].
  DashboardConfProvider call({
    required String dashName,
  }) {
    return DashboardConfProvider(
      dashName: dashName,
    );
  }

  @override
  DashboardConfProvider getProviderOverride(
    covariant DashboardConfProvider provider,
  ) {
    return call(
      dashName: provider.dashName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dashboardConfProvider';
}

/// See also [DashboardConf].
class DashboardConfProvider
    extends AutoDisposeNotifierProviderImpl<DashboardConf, DashboardConfig> {
  /// See also [DashboardConf].
  DashboardConfProvider({
    required String dashName,
  }) : this._internal(
          () => DashboardConf()..dashName = dashName,
          from: dashboardConfProvider,
          name: r'dashboardConfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dashboardConfHash,
          dependencies: DashboardConfFamily._dependencies,
          allTransitiveDependencies:
              DashboardConfFamily._allTransitiveDependencies,
          dashName: dashName,
        );

  DashboardConfProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dashName,
  }) : super.internal();

  final String dashName;

  @override
  DashboardConfig runNotifierBuild(
    covariant DashboardConf notifier,
  ) {
    return notifier.build(
      dashName: dashName,
    );
  }

  @override
  Override overrideWith(DashboardConf Function() create) {
    return ProviderOverride(
      origin: this,
      override: DashboardConfProvider._internal(
        () => create()..dashName = dashName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dashName: dashName,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<DashboardConf, DashboardConfig>
      createElement() {
    return _DashboardConfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DashboardConfProvider && other.dashName == dashName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dashName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DashboardConfRef on AutoDisposeNotifierProviderRef<DashboardConfig> {
  /// The parameter `dashName` of this provider.
  String get dashName;
}

class _DashboardConfProviderElement
    extends AutoDisposeNotifierProviderElement<DashboardConf, DashboardConfig>
    with DashboardConfRef {
  _DashboardConfProviderElement(super.provider);

  @override
  String get dashName => (origin as DashboardConfProvider).dashName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
