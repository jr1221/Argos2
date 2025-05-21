// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardConfigImpl _$$DashboardConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardConfigImpl(
      data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
      crossAxisCount: (json['crossAxisCount'] as num).toInt(),
    );

Map<String, dynamic> _$$DashboardConfigImplToJson(
        _$DashboardConfigImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'crossAxisCount': instance.crossAxisCount,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDashboardConfHash() => r'd72ea0bceceb3e8d13466618dc10a6c5f88a8646';

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

/// See also [getDashboardConf].
@ProviderFor(getDashboardConf)
const getDashboardConfProvider = GetDashboardConfFamily();

/// See also [getDashboardConf].
class GetDashboardConfFamily extends Family<DashboardConfig> {
  /// See also [getDashboardConf].
  const GetDashboardConfFamily();

  /// See also [getDashboardConf].
  GetDashboardConfProvider call({
    required String dashName,
  }) {
    return GetDashboardConfProvider(
      dashName: dashName,
    );
  }

  @override
  GetDashboardConfProvider getProviderOverride(
    covariant GetDashboardConfProvider provider,
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
  String? get name => r'getDashboardConfProvider';
}

/// See also [getDashboardConf].
class GetDashboardConfProvider extends AutoDisposeProvider<DashboardConfig> {
  /// See also [getDashboardConf].
  GetDashboardConfProvider({
    required String dashName,
  }) : this._internal(
          (ref) => getDashboardConf(
            ref as GetDashboardConfRef,
            dashName: dashName,
          ),
          from: getDashboardConfProvider,
          name: r'getDashboardConfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDashboardConfHash,
          dependencies: GetDashboardConfFamily._dependencies,
          allTransitiveDependencies:
              GetDashboardConfFamily._allTransitiveDependencies,
          dashName: dashName,
        );

  GetDashboardConfProvider._internal(
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
  Override overrideWith(
    DashboardConfig Function(GetDashboardConfRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDashboardConfProvider._internal(
        (ref) => create(ref as GetDashboardConfRef),
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
  AutoDisposeProviderElement<DashboardConfig> createElement() {
    return _GetDashboardConfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDashboardConfProvider && other.dashName == dashName;
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
mixin GetDashboardConfRef on AutoDisposeProviderRef<DashboardConfig> {
  /// The parameter `dashName` of this provider.
  String get dashName;
}

class _GetDashboardConfProviderElement
    extends AutoDisposeProviderElement<DashboardConfig>
    with GetDashboardConfRef {
  _GetDashboardConfProviderElement(super.provider);

  @override
  String get dashName => (origin as GetDashboardConfProvider).dashName;
}

String _$availableDashboardsManagerHash() =>
    r'5f954ebcc54b9bbce6dc4dd545de1abd49b0455f';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
