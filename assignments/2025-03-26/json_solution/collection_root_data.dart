import 'package:modu_3_dart_study/2025-03-26/json_solution/collection_chart_data.dart';

class CollectionRootData {
  List<CollectionChartData> collectionChartDataList; //루트 : 컬렉션 데이터 리스트

  CollectionRootData({required this.collectionChartDataList});

  // 역직렬화 Json 데이터를 CollectionRootData 객체로 변환
  // SalePrice에 null 처리 이유 : 'collection68' salePrice 데이터 없음.
  CollectionRootData.fromJson(Map<String, dynamic> json)
      : collectionChartDataList = (json['collectionChartDataList'] as List)
      .map((e) => CollectionChartData.fromJson(e as Map<String, dynamic>))
      .toList();


  // 직렬화 CollectionRootData 객체를 Json 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'collectionChartDataList': collectionChartDataList.map((e) => e.toJson()).toList(),
    };
  }
}