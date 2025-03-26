import 'dart:convert';
import 'dart:io';

import 'collection_chart_data.dart';

void main() {
  String json =
      File('assignments/2025-03-26/chart_data.json').readAsStringSync();
  Map<String, dynamic> jsonMap = jsonDecode(json);
  print(jsonMap['collectionChartDataList'].runtimeType);
  print(jsonMap['collectionChartDataList'][0].runtimeType);

  for (Map<String, dynamic> data in jsonMap['collectionChartDataList']) {
    print(CollectionChartData.fromJson(data));
  }
}