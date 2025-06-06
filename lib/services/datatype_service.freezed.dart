// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'datatype_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublicDataType implements DiagnosticableTreeMixin {
  String get name;
  String get unit;

  /// Create a copy of PublicDataType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PublicDataTypeCopyWith<PublicDataType> get copyWith =>
      _$PublicDataTypeCopyWithImpl<PublicDataType>(
          this as PublicDataType, _$identity);

  /// Serializes this PublicDataType to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'PublicDataType'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('unit', unit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PublicDataType &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, unit);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicDataType(name: $name, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $PublicDataTypeCopyWith<$Res> {
  factory $PublicDataTypeCopyWith(
          PublicDataType value, $Res Function(PublicDataType) _then) =
      _$PublicDataTypeCopyWithImpl;
  @useResult
  $Res call({String name, String unit});
}

/// @nodoc
class _$PublicDataTypeCopyWithImpl<$Res>
    implements $PublicDataTypeCopyWith<$Res> {
  _$PublicDataTypeCopyWithImpl(this._self, this._then);

  final PublicDataType _self;
  final $Res Function(PublicDataType) _then;

  /// Create a copy of PublicDataType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? unit = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PublicDataType with DiagnosticableTreeMixin implements PublicDataType {
  const _PublicDataType({required this.name, required this.unit});
  factory _PublicDataType.fromJson(Map<String, dynamic> json) =>
      _$PublicDataTypeFromJson(json);

  @override
  final String name;
  @override
  final String unit;

  /// Create a copy of PublicDataType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PublicDataTypeCopyWith<_PublicDataType> get copyWith =>
      __$PublicDataTypeCopyWithImpl<_PublicDataType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PublicDataTypeToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'PublicDataType'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('unit', unit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PublicDataType &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, unit);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicDataType(name: $name, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class _$PublicDataTypeCopyWith<$Res>
    implements $PublicDataTypeCopyWith<$Res> {
  factory _$PublicDataTypeCopyWith(
          _PublicDataType value, $Res Function(_PublicDataType) _then) =
      __$PublicDataTypeCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String unit});
}

/// @nodoc
class __$PublicDataTypeCopyWithImpl<$Res>
    implements _$PublicDataTypeCopyWith<$Res> {
  __$PublicDataTypeCopyWithImpl(this._self, this._then);

  final _PublicDataType _self;
  final $Res Function(_PublicDataType) _then;

  /// Create a copy of PublicDataType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? unit = null,
  }) {
    return _then(_PublicDataType(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
