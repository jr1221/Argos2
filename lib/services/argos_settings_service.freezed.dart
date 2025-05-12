// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'argos_settings_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScyllaSettings _$ScyllaSettingsFromJson(Map<String, dynamic> json) {
  return _ScyllaSettings.fromJson(json);
}

/// @nodoc
mixin _$ScyllaSettings {
  bool get data_upload_disabled => throw _privateConstructorUsedError;
  int get batch_upsert_time => throw _privateConstructorUsedError;
  int get ratelimit_mode => throw _privateConstructorUsedError;
  int get static_ratelimit_time => throw _privateConstructorUsedError;
  int get socket_discard_percent => throw _privateConstructorUsedError;

  /// Serializes this ScyllaSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScyllaSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScyllaSettingsCopyWith<ScyllaSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScyllaSettingsCopyWith<$Res> {
  factory $ScyllaSettingsCopyWith(
          ScyllaSettings value, $Res Function(ScyllaSettings) then) =
      _$ScyllaSettingsCopyWithImpl<$Res, ScyllaSettings>;
  @useResult
  $Res call(
      {bool data_upload_disabled,
      int batch_upsert_time,
      int ratelimit_mode,
      int static_ratelimit_time,
      int socket_discard_percent});
}

/// @nodoc
class _$ScyllaSettingsCopyWithImpl<$Res, $Val extends ScyllaSettings>
    implements $ScyllaSettingsCopyWith<$Res> {
  _$ScyllaSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScyllaSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data_upload_disabled = null,
    Object? batch_upsert_time = null,
    Object? ratelimit_mode = null,
    Object? static_ratelimit_time = null,
    Object? socket_discard_percent = null,
  }) {
    return _then(_value.copyWith(
      data_upload_disabled: null == data_upload_disabled
          ? _value.data_upload_disabled
          : data_upload_disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      batch_upsert_time: null == batch_upsert_time
          ? _value.batch_upsert_time
          : batch_upsert_time // ignore: cast_nullable_to_non_nullable
              as int,
      ratelimit_mode: null == ratelimit_mode
          ? _value.ratelimit_mode
          : ratelimit_mode // ignore: cast_nullable_to_non_nullable
              as int,
      static_ratelimit_time: null == static_ratelimit_time
          ? _value.static_ratelimit_time
          : static_ratelimit_time // ignore: cast_nullable_to_non_nullable
              as int,
      socket_discard_percent: null == socket_discard_percent
          ? _value.socket_discard_percent
          : socket_discard_percent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScyllaSettingsImplCopyWith<$Res>
    implements $ScyllaSettingsCopyWith<$Res> {
  factory _$$ScyllaSettingsImplCopyWith(_$ScyllaSettingsImpl value,
          $Res Function(_$ScyllaSettingsImpl) then) =
      __$$ScyllaSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool data_upload_disabled,
      int batch_upsert_time,
      int ratelimit_mode,
      int static_ratelimit_time,
      int socket_discard_percent});
}

/// @nodoc
class __$$ScyllaSettingsImplCopyWithImpl<$Res>
    extends _$ScyllaSettingsCopyWithImpl<$Res, _$ScyllaSettingsImpl>
    implements _$$ScyllaSettingsImplCopyWith<$Res> {
  __$$ScyllaSettingsImplCopyWithImpl(
      _$ScyllaSettingsImpl _value, $Res Function(_$ScyllaSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScyllaSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data_upload_disabled = null,
    Object? batch_upsert_time = null,
    Object? ratelimit_mode = null,
    Object? static_ratelimit_time = null,
    Object? socket_discard_percent = null,
  }) {
    return _then(_$ScyllaSettingsImpl(
      data_upload_disabled: null == data_upload_disabled
          ? _value.data_upload_disabled
          : data_upload_disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      batch_upsert_time: null == batch_upsert_time
          ? _value.batch_upsert_time
          : batch_upsert_time // ignore: cast_nullable_to_non_nullable
              as int,
      ratelimit_mode: null == ratelimit_mode
          ? _value.ratelimit_mode
          : ratelimit_mode // ignore: cast_nullable_to_non_nullable
              as int,
      static_ratelimit_time: null == static_ratelimit_time
          ? _value.static_ratelimit_time
          : static_ratelimit_time // ignore: cast_nullable_to_non_nullable
              as int,
      socket_discard_percent: null == socket_discard_percent
          ? _value.socket_discard_percent
          : socket_discard_percent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScyllaSettingsImpl implements _ScyllaSettings {
  const _$ScyllaSettingsImpl(
      {required this.data_upload_disabled,
      required this.batch_upsert_time,
      required this.ratelimit_mode,
      required this.static_ratelimit_time,
      required this.socket_discard_percent});

  factory _$ScyllaSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScyllaSettingsImplFromJson(json);

  @override
  final bool data_upload_disabled;
  @override
  final int batch_upsert_time;
  @override
  final int ratelimit_mode;
  @override
  final int static_ratelimit_time;
  @override
  final int socket_discard_percent;

  @override
  String toString() {
    return 'ScyllaSettings(data_upload_disabled: $data_upload_disabled, batch_upsert_time: $batch_upsert_time, ratelimit_mode: $ratelimit_mode, static_ratelimit_time: $static_ratelimit_time, socket_discard_percent: $socket_discard_percent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScyllaSettingsImpl &&
            (identical(other.data_upload_disabled, data_upload_disabled) ||
                other.data_upload_disabled == data_upload_disabled) &&
            (identical(other.batch_upsert_time, batch_upsert_time) ||
                other.batch_upsert_time == batch_upsert_time) &&
            (identical(other.ratelimit_mode, ratelimit_mode) ||
                other.ratelimit_mode == ratelimit_mode) &&
            (identical(other.static_ratelimit_time, static_ratelimit_time) ||
                other.static_ratelimit_time == static_ratelimit_time) &&
            (identical(other.socket_discard_percent, socket_discard_percent) ||
                other.socket_discard_percent == socket_discard_percent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      data_upload_disabled,
      batch_upsert_time,
      ratelimit_mode,
      static_ratelimit_time,
      socket_discard_percent);

  /// Create a copy of ScyllaSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScyllaSettingsImplCopyWith<_$ScyllaSettingsImpl> get copyWith =>
      __$$ScyllaSettingsImplCopyWithImpl<_$ScyllaSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScyllaSettingsImplToJson(
      this,
    );
  }
}

abstract class _ScyllaSettings implements ScyllaSettings {
  const factory _ScyllaSettings(
      {required final bool data_upload_disabled,
      required final int batch_upsert_time,
      required final int ratelimit_mode,
      required final int static_ratelimit_time,
      required final int socket_discard_percent}) = _$ScyllaSettingsImpl;

  factory _ScyllaSettings.fromJson(Map<String, dynamic> json) =
      _$ScyllaSettingsImpl.fromJson;

  @override
  bool get data_upload_disabled;
  @override
  int get batch_upsert_time;
  @override
  int get ratelimit_mode;
  @override
  int get static_ratelimit_time;
  @override
  int get socket_discard_percent;

  /// Create a copy of ScyllaSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScyllaSettingsImplCopyWith<_$ScyllaSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
