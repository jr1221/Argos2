// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectionProps {
  Uri get uri => throw _privateConstructorUsedError;
  Uri get mqttUri => throw _privateConstructorUsedError;
  Uri get socketUri => throw _privateConstructorUsedError;
  bool get useMqtt => throw _privateConstructorUsedError;

  /// Create a copy of ConnectionProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectionPropsCopyWith<ConnectionProps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionPropsCopyWith<$Res> {
  factory $ConnectionPropsCopyWith(
          ConnectionProps value, $Res Function(ConnectionProps) then) =
      _$ConnectionPropsCopyWithImpl<$Res, ConnectionProps>;
  @useResult
  $Res call({Uri uri, Uri mqttUri, Uri socketUri, bool useMqtt});
}

/// @nodoc
class _$ConnectionPropsCopyWithImpl<$Res, $Val extends ConnectionProps>
    implements $ConnectionPropsCopyWith<$Res> {
  _$ConnectionPropsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectionProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
    Object? mqttUri = null,
    Object? socketUri = null,
    Object? useMqtt = null,
  }) {
    return _then(_value.copyWith(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
      mqttUri: null == mqttUri
          ? _value.mqttUri
          : mqttUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      socketUri: null == socketUri
          ? _value.socketUri
          : socketUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      useMqtt: null == useMqtt
          ? _value.useMqtt
          : useMqtt // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectionPropsImplCopyWith<$Res>
    implements $ConnectionPropsCopyWith<$Res> {
  factory _$$ConnectionPropsImplCopyWith(_$ConnectionPropsImpl value,
          $Res Function(_$ConnectionPropsImpl) then) =
      __$$ConnectionPropsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uri uri, Uri mqttUri, Uri socketUri, bool useMqtt});
}

/// @nodoc
class __$$ConnectionPropsImplCopyWithImpl<$Res>
    extends _$ConnectionPropsCopyWithImpl<$Res, _$ConnectionPropsImpl>
    implements _$$ConnectionPropsImplCopyWith<$Res> {
  __$$ConnectionPropsImplCopyWithImpl(
      _$ConnectionPropsImpl _value, $Res Function(_$ConnectionPropsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectionProps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
    Object? mqttUri = null,
    Object? socketUri = null,
    Object? useMqtt = null,
  }) {
    return _then(_$ConnectionPropsImpl(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
      mqttUri: null == mqttUri
          ? _value.mqttUri
          : mqttUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      socketUri: null == socketUri
          ? _value.socketUri
          : socketUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      useMqtt: null == useMqtt
          ? _value.useMqtt
          : useMqtt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConnectionPropsImpl
    with DiagnosticableTreeMixin
    implements _ConnectionProps {
  const _$ConnectionPropsImpl(
      {required this.uri,
      required this.mqttUri,
      required this.socketUri,
      required this.useMqtt});

  @override
  final Uri uri;
  @override
  final Uri mqttUri;
  @override
  final Uri socketUri;
  @override
  final bool useMqtt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConnectionProps(uri: $uri, mqttUri: $mqttUri, socketUri: $socketUri, useMqtt: $useMqtt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConnectionProps'))
      ..add(DiagnosticsProperty('uri', uri))
      ..add(DiagnosticsProperty('mqttUri', mqttUri))
      ..add(DiagnosticsProperty('socketUri', socketUri))
      ..add(DiagnosticsProperty('useMqtt', useMqtt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionPropsImpl &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.mqttUri, mqttUri) || other.mqttUri == mqttUri) &&
            (identical(other.socketUri, socketUri) ||
                other.socketUri == socketUri) &&
            (identical(other.useMqtt, useMqtt) || other.useMqtt == useMqtt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uri, mqttUri, socketUri, useMqtt);

  /// Create a copy of ConnectionProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionPropsImplCopyWith<_$ConnectionPropsImpl> get copyWith =>
      __$$ConnectionPropsImplCopyWithImpl<_$ConnectionPropsImpl>(
          this, _$identity);
}

abstract class _ConnectionProps implements ConnectionProps {
  const factory _ConnectionProps(
      {required final Uri uri,
      required final Uri mqttUri,
      required final Uri socketUri,
      required final bool useMqtt}) = _$ConnectionPropsImpl;

  @override
  Uri get uri;
  @override
  Uri get mqttUri;
  @override
  Uri get socketUri;
  @override
  bool get useMqtt;

  /// Create a copy of ConnectionProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionPropsImplCopyWith<_$ConnectionPropsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
