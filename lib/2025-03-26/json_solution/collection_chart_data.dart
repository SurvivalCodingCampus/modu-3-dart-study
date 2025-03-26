
import 'package:modu_3_dart_study/2025-03-26/json_solution/sale_price.dart';

class CollectionChartData {

    String collectionName;
    List<SalePrice>? collectionSalePrice;   //판매가격 리스트 2개씩 있음.

    CollectionChartData({required this.collectionName, required this.collectionSalePrice});

    // 역직렬화 Json 데이터를 CollectionChartData 객체로 변환
    // SalePrice에 null 처리 이유 : 'collection68' salePrice 데이터 없음.
    CollectionChartData.fromJson (Map<String, dynamic> json)
      : collectionName = json['collectionName'] as String,
          collectionSalePrice = (json['collectionSalePrice'] as List?)
              ?.map((e) => SalePrice.fromJson(e as Map<String, dynamic>))
              .toList();

    // 직렬화 CollectionChartData 객체를 Json 데이터로 변환
    Map<String, dynamic> toJson() {
      return {
        'collectionName' : collectionName,
        'collectionSalePrice' : collectionSalePrice?.map((e) => e.toJson()).toList(),
      };
    }


}