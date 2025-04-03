import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import '../../../lib/assignments/basic/2025-03-26/collection_list.dart';

void main() {
  
  test('json file에서 json 데이터 역직렬화 하기', (){
    final file = File('assignments/2025-03-26/chart_data.json');
    final jsonData = jsonDecode(file.readAsStringSync());
    final collectionList = CollectionList.fromJson(jsonData);
    expect(collectionList, isA<CollectionList>(), reason: "역직렬화 테스트");
    expect(collectionList.collectionChartDataList.length, 75, reason: "리스트 길이 테스트");
  });
}