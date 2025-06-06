// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublicData _$PublicDataFromJson(Map<String, dynamic> json) => _PublicData(
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      time: (json['time'] as num).toInt(),
    );

Map<String, dynamic> _$PublicDataToJson(_PublicData instance) =>
    <String, dynamic>{
      'values': instance.values,
      'time': instance.time,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDataWithRunIdHash() => r'46496698d15ec9fcc4de34e3bf0ee52a49fe6ba8';

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

/// See also [getDataWithRunId].
@ProviderFor(getDataWithRunId)
const getDataWithRunIdProvider = GetDataWithRunIdFamily();

/// See also [getDataWithRunId].
class GetDataWithRunIdFamily extends Family<AsyncValue<List<PublicData>>> {
  /// See also [getDataWithRunId].
  const GetDataWithRunIdFamily();

  /// See also [getDataWithRunId].
  GetDataWithRunIdProvider call({
    required String topic,
    required int runId,
  }) {
    return GetDataWithRunIdProvider(
      topic: topic,
      runId: runId,
    );
  }

  @override
  GetDataWithRunIdProvider getProviderOverride(
    covariant GetDataWithRunIdProvider provider,
  ) {
    return call(
      topic: provider.topic,
      runId: provider.runId,
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
  String? get name => r'getDataWithRunIdProvider';
}

/// See also [getDataWithRunId].
class GetDataWithRunIdProvider
    extends AutoDisposeFutureProvider<List<PublicData>> {
  /// See also [getDataWithRunId].
  GetDataWithRunIdProvider({
    required String topic,
    required int runId,
  }) : this._internal(
          (ref) => getDataWithRunId(
            ref as GetDataWithRunIdRef,
            topic: topic,
            runId: runId,
          ),
          from: getDataWithRunIdProvider,
          name: r'getDataWithRunIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDataWithRunIdHash,
          dependencies: GetDataWithRunIdFamily._dependencies,
          allTransitiveDependencies:
              GetDataWithRunIdFamily._allTransitiveDependencies,
          topic: topic,
          runId: runId,
        );

  GetDataWithRunIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.topic,
    required this.runId,
  }) : super.internal();

  final String topic;
  final int runId;

  @override
  Override overrideWith(
    FutureOr<List<PublicData>> Function(GetDataWithRunIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDataWithRunIdProvider._internal(
        (ref) => create(ref as GetDataWithRunIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        topic: topic,
        runId: runId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PublicData>> createElement() {
    return _GetDataWithRunIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDataWithRunIdProvider &&
        other.topic == topic &&
        other.runId == runId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, topic.hashCode);
    hash = _SystemHash.combine(hash, runId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetDataWithRunIdRef on AutoDisposeFutureProviderRef<List<PublicData>> {
  /// The parameter `topic` of this provider.
  String get topic;

  /// The parameter `runId` of this provider.
  int get runId;
}

class _GetDataWithRunIdProviderElement
    extends AutoDisposeFutureProviderElement<List<PublicData>>
    with GetDataWithRunIdRef {
  _GetDataWithRunIdProviderElement(super.provider);

  @override
  String get topic => (origin as GetDataWithRunIdProvider).topic;
  @override
  int get runId => (origin as GetDataWithRunIdProvider).runId;
}

String _$getMultiDataWithRunIdHash() =>
    r'954c97fc763bf37a5a162842cc0bd1783da241a7';

/// See also [getMultiDataWithRunId].
@ProviderFor(getMultiDataWithRunId)
const getMultiDataWithRunIdProvider = GetMultiDataWithRunIdFamily();

/// See also [getMultiDataWithRunId].
class GetMultiDataWithRunIdFamily
    extends Family<AsyncValue<Map<String, List<PublicData>>>> {
  /// See also [getMultiDataWithRunId].
  const GetMultiDataWithRunIdFamily();

  /// See also [getMultiDataWithRunId].
  GetMultiDataWithRunIdProvider call({
    required HashSet<PublicDataType> topics,
    required int runId,
  }) {
    return GetMultiDataWithRunIdProvider(
      topics: topics,
      runId: runId,
    );
  }

  @override
  GetMultiDataWithRunIdProvider getProviderOverride(
    covariant GetMultiDataWithRunIdProvider provider,
  ) {
    return call(
      topics: provider.topics,
      runId: provider.runId,
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
  String? get name => r'getMultiDataWithRunIdProvider';
}

/// See also [getMultiDataWithRunId].
class GetMultiDataWithRunIdProvider
    extends AutoDisposeFutureProvider<Map<String, List<PublicData>>> {
  /// See also [getMultiDataWithRunId].
  GetMultiDataWithRunIdProvider({
    required HashSet<PublicDataType> topics,
    required int runId,
  }) : this._internal(
          (ref) => getMultiDataWithRunId(
            ref as GetMultiDataWithRunIdRef,
            topics: topics,
            runId: runId,
          ),
          from: getMultiDataWithRunIdProvider,
          name: r'getMultiDataWithRunIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMultiDataWithRunIdHash,
          dependencies: GetMultiDataWithRunIdFamily._dependencies,
          allTransitiveDependencies:
              GetMultiDataWithRunIdFamily._allTransitiveDependencies,
          topics: topics,
          runId: runId,
        );

  GetMultiDataWithRunIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.topics,
    required this.runId,
  }) : super.internal();

  final HashSet<PublicDataType> topics;
  final int runId;

  @override
  Override overrideWith(
    FutureOr<Map<String, List<PublicData>>> Function(
            GetMultiDataWithRunIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMultiDataWithRunIdProvider._internal(
        (ref) => create(ref as GetMultiDataWithRunIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        topics: topics,
        runId: runId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, List<PublicData>>>
      createElement() {
    return _GetMultiDataWithRunIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMultiDataWithRunIdProvider &&
        other.topics == topics &&
        other.runId == runId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, topics.hashCode);
    hash = _SystemHash.combine(hash, runId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMultiDataWithRunIdRef
    on AutoDisposeFutureProviderRef<Map<String, List<PublicData>>> {
  /// The parameter `topics` of this provider.
  HashSet<PublicDataType> get topics;

  /// The parameter `runId` of this provider.
  int get runId;
}

class _GetMultiDataWithRunIdProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, List<PublicData>>>
    with GetMultiDataWithRunIdRef {
  _GetMultiDataWithRunIdProviderElement(super.provider);

  @override
  HashSet<PublicDataType> get topics =>
      (origin as GetMultiDataWithRunIdProvider).topics;
  @override
  int get runId => (origin as GetMultiDataWithRunIdProvider).runId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
