import 'dart:convert';
import 'dart:io';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-26/collection_chart_data.dart';
import '../../../playground/mar/2025-03-26/collection_chart_data_list.dart';
import '../../../playground/mar/2025-03-26/sale_price.dart';

void main() {
  const int chartLength = 75;
  test('collectionsChartTest', () {
    final file = File(r'playground/mar/2025-03-26/test.json');
    final jsonString = file.readAsStringSync();

    CollectionChartDataList collectionChartDataList =
        CollectionChartDataList.fromJson(jsonDecode(jsonString));
    CollectionChartdata collectionChartdata =
        collectionChartDataList.collectionChartDataList[0];
    SalePrice salePrice = collectionChartdata.collectionSalePrice[0];

    expect(collectionChartDataList, isA<CollectionChartDataList>());
    expect(
      collectionChartDataList.collectionChartDataList.length,
      equals(chartLength),
    );
    expect(collectionChartdata, isA<CollectionChartdata>());
    expect(salePrice, isA<SalePrice>());
  });
}
