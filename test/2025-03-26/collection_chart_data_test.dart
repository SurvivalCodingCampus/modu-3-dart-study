import 'dart:convert';
import 'dart:io';

// import 'package:collection/collection.dart';
import 'package:test/test.dart';

import '../../assignments/2025-03-26/collection_chart_data.dart';
// import '../../assignments/2025-03-26/collection_sale_price.dart';

void main() {
  String json =
      File('assignments/2025-03-26/chart_data.json').readAsStringSync();
  Map<String, dynamic> jsonMap = jsonDecode(json);

  test('fromJson 테스트', () {
    for (Map<String, dynamic> data in jsonMap['collectionChartDataList']) {
      print(CollectionChartData.fromJson(data));
    }
  });

  // test('dd', () {
  //   String testJson = File('test/2025-03-26/test_data.json').readAsStringSync();
  //   // print(testJson);
  //   Map<String, dynamic> testMap = jsonDecode(testJson);
  //   // print([testMap]);
  //   // final List<Map<String,dynamic>> dataList = testMap['collectionChartDataList'];
  //   final dataList = [
  //     CollectionChartData('collection1', [
  //       CollectionSalePrice(58.25, DateTime.parse('2023-03-26T08:00:00')),
  //       CollectionSalePrice(58.5, DateTime.parse('2023-03-26T08:00:10')),
  //     ]),
  //     CollectionChartData('collection2', [
  //       CollectionSalePrice(58.75, DateTime.parse('2023-03-26T08:00:20')),
  //       CollectionSalePrice(59.0, DateTime.parse('2023-03-26T08:00:30')),
  //     ]),
  //   ];
  //   final List<Map<String, dynamic>> dataMap =
  //       dataList.map((data) {
  //         return {
  //           "collectionName": data.collectionName,
  //           "collectionSalePrice":
  //               data.collectionSalePrice?.map((priceData) {
  //                 return {
  //                   "price": priceData.price,
  //                   "cvtDatetime": priceData.cvtDatetime
  //                       .toIso8601String()
  //                       .substring(
  //                         0,
  //                         priceData.cvtDatetime.toIso8601String().length - 4,
  //                       ),
  //                 };
  //               }).toList(),
  //         };
  //       }).toList();

  //   // print(testMap['collectionChartDataList']);
  //   // print(dataMap);
  //   // print(ListEquality().equals(testMap['collectionChartDataList'], dataMap));
  //   // print(testMap['collectionChartDataList'].runtimeType);
  //   // print(dataMap.runtimeType);

  //   // print('---');
  //   // print(jsonEncode(testMap['collectionChartDataList']));
  //   // print(jsonEncode(dataMap));

  //   expect(jsonEncode(testMap['collectionChartDataList']) == jsonEncode(dataMap), isTrue);
  //   // final resultJson = jsonEncode(dataList);
  //   // print(resultJson);
  // });
}
