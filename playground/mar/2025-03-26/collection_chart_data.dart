import 'sale_price.dart';

class CollectionChartdata {
  String collectionName;
  List<SalePrice> collectionSalePrice = [];

  Map<String, dynamic> toJson() {
    return {'collectionName': collectionName, 'salePrice': collectionSalePrice};
  }

  CollectionChartdata.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'] {
    if (json['collectionSalePrice'] != null) {
      for (final i in json['collectionSalePrice']) {
        collectionSalePrice.add(SalePrice.fromJson(i));
      }
    }
  }

  @override
  String toString() {
    return 'CollectionChartdata{collectionName: $collectionName, collectionSalePrice: $collectionSalePrice}';
  }
}
