// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicData _$PublicDataFromJson(Map<String, dynamic> json) {
  return _PublicData.fromJson(json);
}

/// @nodoc
mixin _$PublicData {
  List<double> get values => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;

  /// Serializes this PublicData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicDataCopyWith<PublicData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicDataCopyWith<$Res> {
  factory $PublicDataCopyWith(
          PublicData value, $Res Function(PublicData) then) =
      _$PublicDataCopyWithImpl<$Res, PublicData>;
  @useResult
  $Res call({List<double> values, int time});
}

/// @nodoc
class _$PublicDataCopyWithImpl<$Res, $Val extends PublicData>
    implements $PublicDataCopyWith<$Res> {
  _$PublicDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicDataImplCopyWith<$Res>
    implements $PublicDataCopyWith<$Res> {
  factory _$$PublicDataImplCopyWith(
          _$PublicDataImpl value, $Res Function(_$PublicDataImpl) then) =
      __$$PublicDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> values, int time});
}

/// @nodoc
class __$$PublicDataImplCopyWithImpl<$Res>
    extends _$PublicDataCopyWithImpl<$Res, _$PublicDataImpl>
    implements _$$PublicDataImplCopyWith<$Res> {
  __$$PublicDataImplCopyWithImpl(
      _$PublicDataImpl _value, $Res Function(_$PublicDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublicData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? time = null,
  }) {
    return _then(_$PublicDataImpl(
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicDataImpl with DiagnosticableTreeMixin implements _PublicData {
  const _$PublicDataImpl(
      {required final List<double> values, required this.time})
      : _values = values;

  factory _$PublicDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicDataImplFromJson(json);

  final List<double> _values;
  @override
  List<double> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final int time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicData(values: $values, time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublicData'))
      ..add(DiagnosticsProperty('values', values))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicDataImpl &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_values), time);

  /// Create a copy of PublicData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicDataImplCopyWith<_$PublicDataImpl> get copyWith =>
      __$$PublicDataImplCopyWithImpl<_$PublicDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicDataImplToJson(
      this,
    );
  }
}

abstract class _PublicData implements PublicData {
  const factory _PublicData(
      {required final List<double> values,
      required final int time}) = _$PublicDataImpl;

  factory _PublicData.fromJson(Map<String, dynamic> json) =
      _$PublicDataImpl.fromJson;

  @override
  List<double> get values;
  @override
  int get time;

  /// Create a copy of PublicData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicDataImplCopyWith<_$PublicDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
