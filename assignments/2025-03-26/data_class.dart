import 'dart:convert';
import 'dart:io';

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

class CollectionChartData {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;
  CollectionChartData(this.collectionName, this.collectionSalePrice);

  CollectionChartData.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'],
      collectionSalePrice =
          json['collectionSalePrice'] == null
              ? null
              : (json['collectionSalePrice'] as List)
                  .map((e) => CollectionSalePrice.fromJson(e))
                  .toList();

  @override
  String toString() {
    return 'collectionName : $collectionName, collectionSalePrice : $collectionSalePrice';
  }
}

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = DateTime.parse(json['cvtDatetime']);

  @override
  String toString() {
    return 'price : $price, cvtDatetime : $cvtDatetime';
  }
}
