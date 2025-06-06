// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardConfig {
  List<String> get topics;
  int get crossAxisCount;

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardConfigCopyWith<DashboardConfig> get copyWith =>
      _$DashboardConfigCopyWithImpl<DashboardConfig>(
          this as DashboardConfig, _$identity);

  /// Serializes this DashboardConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardConfig &&
            const DeepCollectionEquality().equals(other.topics, topics) &&
            (identical(other.crossAxisCount, crossAxisCount) ||
                other.crossAxisCount == crossAxisCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(topics), crossAxisCount);

  @override
  String toString() {
    return 'DashboardConfig(topics: $topics, crossAxisCount: $crossAxisCount)';
  }
}

/// @nodoc
abstract mixin class $DashboardConfigCopyWith<$Res> {
  factory $DashboardConfigCopyWith(
          DashboardConfig value, $Res Function(DashboardConfig) _then) =
      _$DashboardConfigCopyWithImpl;
  @useResult
  $Res call({List<String> topics, int crossAxisCount});
}

/// @nodoc
class _$DashboardConfigCopyWithImpl<$Res>
    implements $DashboardConfigCopyWith<$Res> {
  _$DashboardConfigCopyWithImpl(this._self, this._then);

  final DashboardConfig _self;
  final $Res Function(DashboardConfig) _then;

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topics = null,
    Object? crossAxisCount = null,
  }) {
    return _then(_self.copyWith(
      topics: null == topics
          ? _self.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      crossAxisCount: null == crossAxisCount
          ? _self.crossAxisCount
          : crossAxisCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardConfig implements DashboardConfig {
  const _DashboardConfig(
      {required final List<String> topics, required this.crossAxisCount})
      : _topics = topics;
  factory _DashboardConfig.fromJson(Map<String, dynamic> json) =>
      _$DashboardConfigFromJson(json);

  final List<String> _topics;
  @override
  List<String> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  final int crossAxisCount;

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardConfigCopyWith<_DashboardConfig> get copyWith =>
      __$DashboardConfigCopyWithImpl<_DashboardConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardConfig &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.crossAxisCount, crossAxisCount) ||
                other.crossAxisCount == crossAxisCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_topics), crossAxisCount);

  @override
  String toString() {
    return 'DashboardConfig(topics: $topics, crossAxisCount: $crossAxisCount)';
  }
}

/// @nodoc
abstract mixin class _$DashboardConfigCopyWith<$Res>
    implements $DashboardConfigCopyWith<$Res> {
  factory _$DashboardConfigCopyWith(
          _DashboardConfig value, $Res Function(_DashboardConfig) _then) =
      __$DashboardConfigCopyWithImpl;
  @override
  @useResult
  $Res call({List<String> topics, int crossAxisCount});
}

/// @nodoc
class __$DashboardConfigCopyWithImpl<$Res>
    implements _$DashboardConfigCopyWith<$Res> {
  __$DashboardConfigCopyWithImpl(this._self, this._then);

  final _DashboardConfig _self;
  final $Res Function(_DashboardConfig) _then;

  /// Create a copy of DashboardConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topics = null,
    Object? crossAxisCount = null,
  }) {
    return _then(_DashboardConfig(
      topics: null == topics
          ? _self._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      crossAxisCount: null == crossAxisCount
          ? _self.crossAxisCount
          : crossAxisCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
