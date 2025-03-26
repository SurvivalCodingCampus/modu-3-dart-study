import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-26/soluation1/data_class.dart';
import 'package:test/test.dart';

void main() {
  test("불러진 데이터에 맞는 클래스 생성 테스트", () {
    final String jsonStringData =
        File('lib/2025-03-26/soluation1/chart_data.json').readAsStringSync();
    final jsonData = jsonDecode(jsonStringData);
    final List targetData = jsonData["collectionChartDataList"];

    for (Map collection in targetData) {
      print(
        ChatData(
          name: collection["collectionName"],
          salePrice: collection["collectionSalePrice"] ?? [],
        ),
      );
    }
  });
}
