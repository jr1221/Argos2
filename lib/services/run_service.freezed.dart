// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'run_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicRun _$PublicRunFromJson(Map<String, dynamic> json) {
  return _PublicRun.fromJson(json);
}

/// @nodoc
mixin _$PublicRun {
  int get id => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  String get driverName => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this PublicRun to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicRun
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicRunCopyWith<PublicRun> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicRunCopyWith<$Res> {
  factory $PublicRunCopyWith(PublicRun value, $Res Function(PublicRun) then) =
      _$PublicRunCopyWithImpl<$Res, PublicRun>;
  @useResult
  $Res call(
      {int id, String locationName, String driverName, int time, String notes});
}

/// @nodoc
class _$PublicRunCopyWithImpl<$Res, $Val extends PublicRun>
    implements $PublicRunCopyWith<$Res> {
  _$PublicRunCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicRun
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locationName = null,
    Object? driverName = null,
    Object? time = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicRunImplCopyWith<$Res>
    implements $PublicRunCopyWith<$Res> {
  factory _$$PublicRunImplCopyWith(
          _$PublicRunImpl value, $Res Function(_$PublicRunImpl) then) =
      __$$PublicRunImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String locationName, String driverName, int time, String notes});
}

/// @nodoc
class __$$PublicRunImplCopyWithImpl<$Res>
    extends _$PublicRunCopyWithImpl<$Res, _$PublicRunImpl>
    implements _$$PublicRunImplCopyWith<$Res> {
  __$$PublicRunImplCopyWithImpl(
      _$PublicRunImpl _value, $Res Function(_$PublicRunImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublicRun
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locationName = null,
    Object? driverName = null,
    Object? time = null,
    Object? notes = null,
  }) {
    return _then(_$PublicRunImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicRunImpl with DiagnosticableTreeMixin implements _PublicRun {
  const _$PublicRunImpl(
      {required this.id,
      required this.locationName,
      required this.driverName,
      required this.time,
      required this.notes});

  factory _$PublicRunImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicRunImplFromJson(json);

  @override
  final int id;
  @override
  final String locationName;
  @override
  final String driverName;
  @override
  final int time;
  @override
  final String notes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicRun(id: $id, locationName: $locationName, driverName: $driverName, time: $time, notes: $notes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublicRun'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('locationName', locationName))
      ..add(DiagnosticsProperty('driverName', driverName))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('notes', notes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicRunImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, locationName, driverName, time, notes);

  /// Create a copy of PublicRun
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicRunImplCopyWith<_$PublicRunImpl> get copyWith =>
      __$$PublicRunImplCopyWithImpl<_$PublicRunImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicRunImplToJson(
      this,
    );
  }
}

abstract class _PublicRun implements PublicRun {
  const factory _PublicRun(
      {required final int id,
      required final String locationName,
      required final String driverName,
      required final int time,
      required final String notes}) = _$PublicRunImpl;

  factory _PublicRun.fromJson(Map<String, dynamic> json) =
      _$PublicRunImpl.fromJson;

  @override
  int get id;
  @override
  String get locationName;
  @override
  String get driverName;
  @override
  int get time;
  @override
  String get notes;

  /// Create a copy of PublicRun
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicRunImplCopyWith<_$PublicRunImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
