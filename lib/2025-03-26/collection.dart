import 'package:modu_3_dart_study/2025-03-26/sale_price.dart';

class Collection {
  String name;
  List<SalePrice> salePrices = [];

  Collection.fromJson(Map<String, dynamic> json)
    : name = json['collectionName'] {
    if (json['collectionSalePrice'] != null) {
      for (final i in json['collectionSalePrice']) {
        salePrices.add(SalePrice.fromJson(i));
      }
    }
  }

  @override
  String toString() {
    return 'Collection{name: $name, salePrices: $salePrices}';
  }
}
