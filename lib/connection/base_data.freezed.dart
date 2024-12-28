// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientData _$ClientDataFromJson(Map<String, dynamic> json) {
  return _ClientData.fromJson(json);
}

/// @nodoc
mixin _$ClientData {
  int get runId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  List<double> get values => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;

  /// Serializes this ClientData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClientData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientDataCopyWith<ClientData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientDataCopyWith<$Res> {
  factory $ClientDataCopyWith(
          ClientData value, $Res Function(ClientData) then) =
      _$ClientDataCopyWithImpl<$Res, ClientData>;
  @useResult
  $Res call(
      {int runId,
      String name,
      String unit,
      List<double> values,
      int timestamp});
}

/// @nodoc
class _$ClientDataCopyWithImpl<$Res, $Val extends ClientData>
    implements $ClientDataCopyWith<$Res> {
  _$ClientDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? name = null,
    Object? unit = null,
    Object? values = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      runId: null == runId
          ? _value.runId
          : runId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientDataImplCopyWith<$Res>
    implements $ClientDataCopyWith<$Res> {
  factory _$$ClientDataImplCopyWith(
          _$ClientDataImpl value, $Res Function(_$ClientDataImpl) then) =
      __$$ClientDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int runId,
      String name,
      String unit,
      List<double> values,
      int timestamp});
}

/// @nodoc
class __$$ClientDataImplCopyWithImpl<$Res>
    extends _$ClientDataCopyWithImpl<$Res, _$ClientDataImpl>
    implements _$$ClientDataImplCopyWith<$Res> {
  __$$ClientDataImplCopyWithImpl(
      _$ClientDataImpl _value, $Res Function(_$ClientDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? name = null,
    Object? unit = null,
    Object? values = null,
    Object? timestamp = null,
  }) {
    return _then(_$ClientDataImpl(
      runId: null == runId
          ? _value.runId
          : runId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientDataImpl with DiagnosticableTreeMixin implements _ClientData {
  const _$ClientDataImpl(
      {required this.runId,
      required this.name,
      required this.unit,
      required final List<double> values,
      required this.timestamp})
      : _values = values;

  factory _$ClientDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientDataImplFromJson(json);

  @override
  final int runId;
  @override
  final String name;
  @override
  final String unit;
  final List<double> _values;
  @override
  List<double> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final int timestamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClientData(runId: $runId, name: $name, unit: $unit, values: $values, timestamp: $timestamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClientData'))
      ..add(DiagnosticsProperty('runId', runId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('unit', unit))
      ..add(DiagnosticsProperty('values', values))
      ..add(DiagnosticsProperty('timestamp', timestamp));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientDataImpl &&
            (identical(other.runId, runId) || other.runId == runId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, runId, name, unit,
      const DeepCollectionEquality().hash(_values), timestamp);

  /// Create a copy of ClientData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientDataImplCopyWith<_$ClientDataImpl> get copyWith =>
      __$$ClientDataImplCopyWithImpl<_$ClientDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientDataImplToJson(
      this,
    );
  }
}

abstract class _ClientData implements ClientData {
  const factory _ClientData(
      {required final int runId,
      required final String name,
      required final String unit,
      required final List<double> values,
      required final int timestamp}) = _$ClientDataImpl;

  factory _ClientData.fromJson(Map<String, dynamic> json) =
      _$ClientDataImpl.fromJson;

  @override
  int get runId;
  @override
  String get name;
  @override
  String get unit;
  @override
  List<double> get values;
  @override
  int get timestamp;

  /// Create a copy of ClientData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientDataImplCopyWith<_$ClientDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
