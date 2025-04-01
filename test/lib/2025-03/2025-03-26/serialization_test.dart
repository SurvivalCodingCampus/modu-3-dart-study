import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03/2025-03-26/collection.dart'
    show Collection;
import 'package:modu_3_dart_study/2025-03/2025-03-26/collections.dart'
    show Collections;
import 'package:modu_3_dart_study/2025-03/2025-03-26/sale_price.dart'
    show SalePrice;
import 'package:test/test.dart';

void main() {
  const String path = 'lib/2025-03/2025-03-26/chart_data.json';
  const int chartLength = 75;

  test('지정된 경로의 JSON 파일을 읽어서 역직렬화 해야한다.', () {
    // Given
    File file = File(path);
    String json = file.readAsStringSync();

    // When
    Collections collections = Collections.fromJson(jsonDecode(json));
    Collection collection = collections.inner[0];
    SalePrice price = collection.salePrices[0];

    // Then
    expect(collections, isA<Collections>());
    expect(collections.inner.length, equals(chartLength));
    expect(collection, isA<Collection>());
    expect(price, isA<SalePrice>());
  });
}
