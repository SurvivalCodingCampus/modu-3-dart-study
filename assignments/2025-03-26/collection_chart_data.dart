import 'collection_sale_price.dart';

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
