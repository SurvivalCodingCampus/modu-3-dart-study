import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-26/chart_data.dart';
import 'package:test/test.dart';

void main() {

  test('json 데이터를 읽고 처리', () {
    File file = File('lib/2025-03-26/chart_data.json');

    final String jsonString = file.readAsStringSync();
    final jsonMap = jsonDecode(jsonString);
    final dataList = CollectionCharDataList.fromJson(jsonMap);

    expect(dataList.collectionCharDataList, isNotEmpty);
    expect(dataList.collectionCharDataList.first.collectionName, isNotEmpty);

    final firstCollection = dataList.collectionCharDataList.first;
    expect(firstCollection.collectionSalePrice, isNotEmpty);
    expect(firstCollection.collectionSalePrice.first.price, greaterThan(0));
    expect(firstCollection.collectionSalePrice.first.cvtDatetime, isA<DateTime>());

  });
}
