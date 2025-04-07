import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/data_source/store_data_source_impl.dart';
import 'package:test/test.dart';

import '../data/stores_json.dart';

void main() {
  test('StoreDataSource', () async {
    final mockClient = MockClient((request) async {
      return Response(
        jsonEncode(storeJson),
        200,
        headers: {"content-type": "application/json; charset=utf-8"},
      );
    });

    final StoreDataSource storeDataSource = StoreDataSourceImpl(
      client: mockClient,
    );

    final dto = await storeDataSource.getStoresResultDto();

    expect(dto.stores, isNotNull);
  });

  test('StoreDataSource 내 잘못', () async {
    final mockClient = MockClient((request) async {
      return Response(
        jsonEncode(storeJson),
        404,
        headers: {"content-type": "application/json; charset=utf-8"},
      );
    });

    final StoreDataSource storeDataSource = StoreDataSourceImpl(
      client: mockClient,
    );

    expect(() => storeDataSource.getStoresResultDto(), throwsA(isA<MyMistakeException>()));
  });

  test('StoreDataSource 내 잘못', () async {
    final mockClient = MockClient((request) async {
      return Response(
        jsonEncode(storeJson),
        500,
        headers: {"content-type": "application/json; charset=utf-8"},
      );
    });

    final StoreDataSource storeDataSource = StoreDataSourceImpl(
      client: mockClient,
    );

    expect(() => storeDataSource.getStoresResultDto(), throwsA(isA<YourMistakeException>()));
  });
}
