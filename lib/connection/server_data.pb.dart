//
//  Generated code. Do not modify.
//  source: server_data.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ServerData extends $pb.GeneratedMessage {
  factory ServerData({
    $core.String? unit,
    $fixnum.Int64? timeUs,
    $core.Iterable<$core.double>? values,
  }) {
    final result = create();
    if (unit != null) {
      result.unit = unit;
    }
    if (timeUs != null) {
      result.timeUs = timeUs;
    }
    if (values != null) {
      result.values.addAll(values);
    }
    return result;
  }
  ServerData._() : super();
  factory ServerData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ServerData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ServerData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'serverdata.v2'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'unit')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'timeUs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$core.double>(4, _omitFieldNames ? '' : 'values', $pb.PbFieldType.KF)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ServerData clone() => ServerData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ServerData copyWith(void Function(ServerData) updates) =>
      super.copyWith((message) => updates(message as ServerData)) as ServerData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerData create() => ServerData._();
  ServerData createEmptyInstance() => create();
  static $pb.PbList<ServerData> createRepeated() => $pb.PbList<ServerData>();
  @$core.pragma('dart2js:noInline')
  static ServerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ServerData>(create);
  static ServerData? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get unit => $_getSZ(0);
  @$pb.TagNumber(2)
  set unit($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUnit() => $_has(0);
  @$pb.TagNumber(2)
  void clearUnit() => clearField(2);

  /// time since unix epoch in MICROSECONDS
  @$pb.TagNumber(3)
  $fixnum.Int64 get timeUs => $_getI64(1);
  @$pb.TagNumber(3)
  set timeUs($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTimeUs() => $_has(1);
  @$pb.TagNumber(3)
  void clearTimeUs() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.double> get values => $_getList(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
