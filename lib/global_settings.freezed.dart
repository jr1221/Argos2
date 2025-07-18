// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectionProps implements DiagnosticableTreeMixin {
  /// current uri, see [useMqtt] if the uri is [mqttUri] or [socketUri]
  Uri get uri;

  /// mqtt URI to use
  Uri get mqttUri;

  /// socket URI to use
  Uri get socketUri;

  /// true if app is in MQTT mode
  bool get useMqtt;

  /// Create a copy of ConnectionProps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConnectionPropsCopyWith<ConnectionProps> get copyWith =>
      _$ConnectionPropsCopyWithImpl<ConnectionProps>(
          this as ConnectionProps, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is ConnectionProps &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.mqttUri, mqttUri) || other.mqttUri == mqttUri) &&
            (identical(other.socketUri, socketUri) ||
                other.socketUri == socketUri) &&
            (identical(other.useMqtt, useMqtt) || other.useMqtt == useMqtt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uri, mqttUri, socketUri, useMqtt);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConnectionProps(uri: $uri, mqttUri: $mqttUri, socketUri: $socketUri, useMqtt: $useMqtt)';
  }
}

/// @nodoc
abstract mixin class $ConnectionPropsCopyWith<$Res> {
  factory $ConnectionPropsCopyWith(
          ConnectionProps value, $Res Function(ConnectionProps) _then) =
      _$ConnectionPropsCopyWithImpl;
  @useResult
  $Res call({Uri uri, Uri mqttUri, Uri socketUri, bool useMqtt});
}

/// @nodoc
class _$ConnectionPropsCopyWithImpl<$Res>
    implements $ConnectionPropsCopyWith<$Res> {
  _$ConnectionPropsCopyWithImpl(this._self, this._then);

  final ConnectionProps _self;
  final $Res Function(ConnectionProps) _then;

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
    return _then(_self.copyWith(
      uri: null == uri
          ? _self.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
      mqttUri: null == mqttUri
          ? _self.mqttUri
          : mqttUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      socketUri: null == socketUri
          ? _self.socketUri
          : socketUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      useMqtt: null == useMqtt
          ? _self.useMqtt
          : useMqtt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ConnectionProps].
extension ConnectionPropsPatterns on ConnectionProps {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ConnectionProps value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConnectionProps() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ConnectionProps value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConnectionProps():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ConnectionProps value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConnectionProps() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Uri uri, Uri mqttUri, Uri socketUri, bool useMqtt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConnectionProps() when $default != null:
        return $default(
            _that.uri, _that.mqttUri, _that.socketUri, _that.useMqtt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Uri uri, Uri mqttUri, Uri socketUri, bool useMqtt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConnectionProps():
        return $default(
            _that.uri, _that.mqttUri, _that.socketUri, _that.useMqtt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Uri uri, Uri mqttUri, Uri socketUri, bool useMqtt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConnectionProps() when $default != null:
        return $default(
            _that.uri, _that.mqttUri, _that.socketUri, _that.useMqtt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ConnectionProps with DiagnosticableTreeMixin implements ConnectionProps {
  const _ConnectionProps(
      {required this.uri,
      required this.mqttUri,
      required this.socketUri,
      required this.useMqtt});

  /// current uri, see [useMqtt] if the uri is [mqttUri] or [socketUri]
  @override
  final Uri uri;

  /// mqtt URI to use
  @override
  final Uri mqttUri;

  /// socket URI to use
  @override
  final Uri socketUri;

  /// true if app is in MQTT mode
  @override
  final bool useMqtt;

  /// Create a copy of ConnectionProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConnectionPropsCopyWith<_ConnectionProps> get copyWith =>
      __$ConnectionPropsCopyWithImpl<_ConnectionProps>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _ConnectionProps &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.mqttUri, mqttUri) || other.mqttUri == mqttUri) &&
            (identical(other.socketUri, socketUri) ||
                other.socketUri == socketUri) &&
            (identical(other.useMqtt, useMqtt) || other.useMqtt == useMqtt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uri, mqttUri, socketUri, useMqtt);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConnectionProps(uri: $uri, mqttUri: $mqttUri, socketUri: $socketUri, useMqtt: $useMqtt)';
  }
}

/// @nodoc
abstract mixin class _$ConnectionPropsCopyWith<$Res>
    implements $ConnectionPropsCopyWith<$Res> {
  factory _$ConnectionPropsCopyWith(
          _ConnectionProps value, $Res Function(_ConnectionProps) _then) =
      __$ConnectionPropsCopyWithImpl;
  @override
  @useResult
  $Res call({Uri uri, Uri mqttUri, Uri socketUri, bool useMqtt});
}

/// @nodoc
class __$ConnectionPropsCopyWithImpl<$Res>
    implements _$ConnectionPropsCopyWith<$Res> {
  __$ConnectionPropsCopyWithImpl(this._self, this._then);

  final _ConnectionProps _self;
  final $Res Function(_ConnectionProps) _then;

  /// Create a copy of ConnectionProps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uri = null,
    Object? mqttUri = null,
    Object? socketUri = null,
    Object? useMqtt = null,
  }) {
    return _then(_ConnectionProps(
      uri: null == uri
          ? _self.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
      mqttUri: null == mqttUri
          ? _self.mqttUri
          : mqttUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      socketUri: null == socketUri
          ? _self.socketUri
          : socketUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      useMqtt: null == useMqtt
          ? _self.useMqtt
          : useMqtt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
