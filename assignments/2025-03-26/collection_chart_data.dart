import 'collection_sale_price.dart';

class CollectionChartData {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  CollectionChartData.name(this.collectionName, this.collectionSalePrice);

  Map<String, dynamic> toJson() {
    return {"collectionName" : collectionName, "collectionSalePrice" : collectionSalePrice?.map((e) => e.toJson()).toList()};
  }

  CollectionChartData.fromJson(Map<String, dynamic> json):
      collectionName = json["collectionName"], collectionSalePrice = (json["collectionSalePrice"] as List<dynamic>?)?.map((e) => CollectionSalePrice.fromJson(e)).toList();
}