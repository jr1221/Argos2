//
//  Generated code. Do not modify.
//  source: server_data.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use serverDataDescriptor instead')
const ServerData$json = {
  '1': 'ServerData',
  '2': [
    {'1': 'unit', '3': 2, '4': 1, '5': 9, '10': 'unit'},
    {'1': 'time_us', '3': 3, '4': 1, '5': 4, '10': 'timeUs'},
    {'1': 'values', '3': 4, '4': 3, '5': 2, '10': 'values'},
  ],
  '9': [
    {'1': 1, '2': 2},
  ],
  '10': ['value'],
};

/// Descriptor for `ServerData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverDataDescriptor = $convert.base64Decode(
    'CgpTZXJ2ZXJEYXRhEhIKBHVuaXQYAiABKAlSBHVuaXQSFwoHdGltZV91cxgDIAEoBFIGdGltZV'
    'VzEhYKBnZhbHVlcxgEIAMoAlIGdmFsdWVzSgQIARACUgV2YWx1ZQ==');
