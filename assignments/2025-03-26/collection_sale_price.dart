import 'sale_price.dart';

class CollectionSalePrice {
  final String collectionName;
  List<SalePrice>? collectionSalePrice;

  CollectionSalePrice(this.collectionName, {this.collectionSalePrice});

  Map<String, dynamic> toJson() => {
    'collectionName': collectionName,
    'collectionSalePrice': collectionSalePrice?.map((e) => e.toJson()).toList(),
  };

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'],
      collectionSalePrice =
          (json['collectionSalePrice'] as List<dynamic>?)
              ?.map((e) => SalePrice.fromJson(e as Map<String, dynamic>))
              .toList();

  @override
  String toString() {
    return '{collectionName : $collectionName, collectionSalePrice : ${collectionSalePrice.toString()}}';
  }
}
