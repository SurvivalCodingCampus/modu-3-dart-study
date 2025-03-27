import 'collection_sale_price.dart';

class CollectionChartDataList {
  String collectionName;
  List<CollectionSalePrice> collectionSalePrice;

  CollectionChartDataList({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'collectionName': collectionName,
      'collectionSalePrice': collectionSalePrice,
    };
  }

  CollectionChartDataList.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'],
      collectionSalePrice =
          (json['collectionSalePrice'] as List?)
              ?.map(
                (e) => CollectionSalePrice.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [];

  @override
  String toString() {
    return 'collectionName = $collectionName collectionSalePrice $collectionSalePrice';
  }
}
