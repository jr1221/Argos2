// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'datatype_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicDataType _$PublicDataTypeFromJson(Map<String, dynamic> json) {
  return _PublicDataType.fromJson(json);
}

/// @nodoc
mixin _$PublicDataType {
  String get name => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  /// Serializes this PublicDataType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicDataType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicDataTypeCopyWith<PublicDataType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicDataTypeCopyWith<$Res> {
  factory $PublicDataTypeCopyWith(
          PublicDataType value, $Res Function(PublicDataType) then) =
      _$PublicDataTypeCopyWithImpl<$Res, PublicDataType>;
  @useResult
  $Res call({String name, String unit});
}

/// @nodoc
class _$PublicDataTypeCopyWithImpl<$Res, $Val extends PublicDataType>
    implements $PublicDataTypeCopyWith<$Res> {
  _$PublicDataTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicDataType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicDataTypeImplCopyWith<$Res>
    implements $PublicDataTypeCopyWith<$Res> {
  factory _$$PublicDataTypeImplCopyWith(_$PublicDataTypeImpl value,
          $Res Function(_$PublicDataTypeImpl) then) =
      __$$PublicDataTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String unit});
}

/// @nodoc
class __$$PublicDataTypeImplCopyWithImpl<$Res>
    extends _$PublicDataTypeCopyWithImpl<$Res, _$PublicDataTypeImpl>
    implements _$$PublicDataTypeImplCopyWith<$Res> {
  __$$PublicDataTypeImplCopyWithImpl(
      _$PublicDataTypeImpl _value, $Res Function(_$PublicDataTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublicDataType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? unit = null,
  }) {
    return _then(_$PublicDataTypeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicDataTypeImpl extends _PublicDataType
    with DiagnosticableTreeMixin {
  const _$PublicDataTypeImpl({required this.name, required this.unit})
      : super._();

  factory _$PublicDataTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicDataTypeImplFromJson(json);

  @override
  final String name;
  @override
  final String unit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicDataType(name: $name, unit: $unit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublicDataType'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('unit', unit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicDataTypeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, unit);

  /// Create a copy of PublicDataType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicDataTypeImplCopyWith<_$PublicDataTypeImpl> get copyWith =>
      __$$PublicDataTypeImplCopyWithImpl<_$PublicDataTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicDataTypeImplToJson(
      this,
    );
  }
}

abstract class _PublicDataType extends PublicDataType {
  const factory _PublicDataType(
      {required final String name,
      required final String unit}) = _$PublicDataTypeImpl;
  const _PublicDataType._() : super._();

  factory _PublicDataType.fromJson(Map<String, dynamic> json) =
      _$PublicDataTypeImpl.fromJson;

  @override
  String get name;
  @override
  String get unit;

  /// Create a copy of PublicDataType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicDataTypeImplCopyWith<_$PublicDataTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
