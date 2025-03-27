import 'dart:convert';
import 'dart:io';

import 'collection_chart_data.dart';

class CollectionChartDataList {
  List<CollectionChartdata> collectionChartDataList = [];

  CollectionChartDataList.fromJson(Map<String, dynamic> json) {
    for (final i in json['collectionChartDataList']) {
      collectionChartDataList.add(CollectionChartdata.fromJson(i));
    }
    ;
  }

  @override
  String toString() {
    return 'CollectionChartDataList{collectionChartDataList: $collectionChartDataList}';
  }
}

void main() {
  final file = File(r'playground/mar/2025-03-26/test.json');
  final jsonString = jsonDecode(file.readAsStringSync());

  CollectionChartDataList lst = CollectionChartDataList.fromJson(jsonString);
  print(lst);
}
