import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/2025-03-26/json_solution/collection_chart_data.dart';
import 'package:modu_3_dart_study/2025-03-26/json_solution/collection_root_data.dart';
import 'package:modu_3_dart_study/2025-03-26/json_solution/sale_price.dart';
import 'package:test/test.dart';

void main() {
  final String jsonFilePath = 'test/2025-03-26/json_solution/chart_data.json';

  // JSON 파일 읽어와서 jsonString 저장.
  String jsonString = File(jsonFilePath).readAsStringSync();


  // JSON 문자열을 Dart 객체로 파싱
  Map<String, dynamic> jsonData = json.decode(jsonString);

  // CollectionRootData 객체로 변환 (RootData 클래스가 정의되어 있다고 가정)
  CollectionRootData rootData = CollectionRootData.fromJson(jsonData);

  // 데이터 출력
  for (CollectionChartData collection in rootData.collectionChartDataList) {
    {
      print('Collection: ${collection.collectionName}');
      if (collection.collectionSalePrice != null) {
        for (SalePrice sale in collection.collectionSalePrice!) {
          print('  Price: ${sale.price}, Time: ${sale.cvtDatetime}');
        }
      } else {
        print('  *** 세일즈 가격 정보가 없습니다. ***');
      }
    }
  }
}