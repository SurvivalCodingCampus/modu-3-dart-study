import 'dart:convert';
import 'dart:typed_data';

import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_02/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_02/data_source/image_data_source_impl.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('ImageDataSource', () {
    final mockClient = MockClient((request) async {
      if (request.url.toString() == 'https://test.com') {
        return http.Response.bytes([1, 2, 3], 200);
      }

      return http.Response(jsonEncode({'message': 'success'}), 200);
    });

    final ImageDataSource imageDataSource = ImageDataSourceImpl(
      client: mockClient,
    );

    test('fetchImage()', () async {
      Uint8List result = await imageDataSource.fetchImage('https://test.com');
      expect(result, equals(Uint8List.fromList([1, 2, 3])));
    });
  });
}
