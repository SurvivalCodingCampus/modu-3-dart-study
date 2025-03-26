import 'sale_price.dart';

class CollectionChartData {
  final String? collectionName;
  final List<SalePrice>? collectionSalePrice;

  const CollectionChartData({this.collectionName, this.collectionSalePrice});

  CollectionChartData.fromJson(Map<String, dynamic> json)
      : collectionName = json['collectionName'] as String?,
        collectionSalePrice = (json['collectionSalePrice'] as List?)
            ?.map((e) => SalePrice.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (collectionName != null) data['collectionName'] = collectionName;
    if (collectionSalePrice != null) {
      data['collectionSalePrice'] =
          collectionSalePrice!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
