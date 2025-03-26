import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import '../../assignments/2025-03-26/collection_chart_data.dart';

void main() {
  String json =
      File('assignments/2025-03-26/chart_data.json').readAsStringSync();
  Map<String, dynamic> jsonMap = jsonDecode(json);

  test('fromJson 테스트', () {
    for (Map<String, dynamic> data in jsonMap['collectionChartDataList']) {
      print(CollectionChartData.fromJson(data));
    }
  });
}
