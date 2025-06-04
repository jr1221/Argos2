// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return _Rule.fromJson(json);
}

/// @nodoc
mixin _$Rule {
  String get id => throw _privateConstructorUsedError;
  String get topic =>
      throw _privateConstructorUsedError; // ignore: non_constant_identifier_names
  int get debounce_time => throw _privateConstructorUsedError;
  String get expr => throw _privateConstructorUsedError;

  /// Serializes this Rule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RuleCopyWith<Rule> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleCopyWith<$Res> {
  factory $RuleCopyWith(Rule value, $Res Function(Rule) then) =
      _$RuleCopyWithImpl<$Res, Rule>;
  @useResult
  $Res call({String id, String topic, int debounce_time, String expr});
}

/// @nodoc
class _$RuleCopyWithImpl<$Res, $Val extends Rule>
    implements $RuleCopyWith<$Res> {
  _$RuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topic = null,
    Object? debounce_time = null,
    Object? expr = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      debounce_time: null == debounce_time
          ? _value.debounce_time
          : debounce_time // ignore: cast_nullable_to_non_nullable
              as int,
      expr: null == expr
          ? _value.expr
          : expr // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RuleImplCopyWith<$Res> implements $RuleCopyWith<$Res> {
  factory _$$RuleImplCopyWith(
          _$RuleImpl value, $Res Function(_$RuleImpl) then) =
      __$$RuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String topic, int debounce_time, String expr});
}

/// @nodoc
class __$$RuleImplCopyWithImpl<$Res>
    extends _$RuleCopyWithImpl<$Res, _$RuleImpl>
    implements _$$RuleImplCopyWith<$Res> {
  __$$RuleImplCopyWithImpl(_$RuleImpl _value, $Res Function(_$RuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topic = null,
    Object? debounce_time = null,
    Object? expr = null,
  }) {
    return _then(_$RuleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      debounce_time: null == debounce_time
          ? _value.debounce_time
          : debounce_time // ignore: cast_nullable_to_non_nullable
              as int,
      expr: null == expr
          ? _value.expr
          : expr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RuleImpl implements _Rule {
  const _$RuleImpl(
      {required this.id,
      required this.topic,
      required this.debounce_time,
      required this.expr});

  factory _$RuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RuleImplFromJson(json);

  @override
  final String id;
  @override
  final String topic;
// ignore: non_constant_identifier_names
  @override
  final int debounce_time;
  @override
  final String expr;

  @override
  String toString() {
    return 'Rule(id: $id, topic: $topic, debounce_time: $debounce_time, expr: $expr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.debounce_time, debounce_time) ||
                other.debounce_time == debounce_time) &&
            (identical(other.expr, expr) || other.expr == expr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, topic, debounce_time, expr);

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleImplCopyWith<_$RuleImpl> get copyWith =>
      __$$RuleImplCopyWithImpl<_$RuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RuleImplToJson(
      this,
    );
  }
}

abstract class _Rule implements Rule {
  const factory _Rule(
      {required final String id,
      required final String topic,
      required final int debounce_time,
      required final String expr}) = _$RuleImpl;

  factory _Rule.fromJson(Map<String, dynamic> json) = _$RuleImpl.fromJson;

  @override
  String get id;
  @override
  String get topic; // ignore: non_constant_identifier_names
  @override
  int get debounce_time;
  @override
  String get expr;

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleImplCopyWith<_$RuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RuleNotification _$RuleNotificationFromJson(Map<String, dynamic> json) {
  return _RuleNotification.fromJson(json);
}

/// @nodoc
mixin _$RuleNotification {
  String get id => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  List<double> get values => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;

  /// Serializes this RuleNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RuleNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RuleNotificationCopyWith<RuleNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleNotificationCopyWith<$Res> {
  factory $RuleNotificationCopyWith(
          RuleNotification value, $Res Function(RuleNotification) then) =
      _$RuleNotificationCopyWithImpl<$Res, RuleNotification>;
  @useResult
  $Res call({String id, String topic, List<double> values, DateTime time});
}

/// @nodoc
class _$RuleNotificationCopyWithImpl<$Res, $Val extends RuleNotification>
    implements $RuleNotificationCopyWith<$Res> {
  _$RuleNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuleNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topic = null,
    Object? values = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RuleNotificationImplCopyWith<$Res>
    implements $RuleNotificationCopyWith<$Res> {
  factory _$$RuleNotificationImplCopyWith(_$RuleNotificationImpl value,
          $Res Function(_$RuleNotificationImpl) then) =
      __$$RuleNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String topic, List<double> values, DateTime time});
}

/// @nodoc
class __$$RuleNotificationImplCopyWithImpl<$Res>
    extends _$RuleNotificationCopyWithImpl<$Res, _$RuleNotificationImpl>
    implements _$$RuleNotificationImplCopyWith<$Res> {
  __$$RuleNotificationImplCopyWithImpl(_$RuleNotificationImpl _value,
      $Res Function(_$RuleNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topic = null,
    Object? values = null,
    Object? time = null,
  }) {
    return _then(_$RuleNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<double>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RuleNotificationImpl implements _RuleNotification {
  const _$RuleNotificationImpl(
      {required this.id,
      required this.topic,
      required final List<double> values,
      required this.time})
      : _values = values;

  factory _$RuleNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$RuleNotificationImplFromJson(json);

  @override
  final String id;
  @override
  final String topic;
  final List<double> _values;
  @override
  List<double> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final DateTime time;

  @override
  String toString() {
    return 'RuleNotification(id: $id, topic: $topic, values: $values, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, topic,
      const DeepCollectionEquality().hash(_values), time);

  /// Create a copy of RuleNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleNotificationImplCopyWith<_$RuleNotificationImpl> get copyWith =>
      __$$RuleNotificationImplCopyWithImpl<_$RuleNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RuleNotificationImplToJson(
      this,
    );
  }
}

abstract class _RuleNotification implements RuleNotification {
  const factory _RuleNotification(
      {required final String id,
      required final String topic,
      required final List<double> values,
      required final DateTime time}) = _$RuleNotificationImpl;

  factory _RuleNotification.fromJson(Map<String, dynamic> json) =
      _$RuleNotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get topic;
  @override
  List<double> get values;
  @override
  DateTime get time;

  /// Create a copy of RuleNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleNotificationImplCopyWith<_$RuleNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
