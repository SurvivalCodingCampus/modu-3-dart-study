import 'package:collection/collection.dart';

import 'index.dart';

class CollectionChartData {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  CollectionChartData({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  CollectionChartData.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'] as String,
      collectionSalePrice =
          json['collectionSalePrice'] != null
              ? (json['collectionSalePrice'] as List?)
                  ?.map(
                    (e) =>
                        CollectionSalePrice.fromJson(e as Map<String, dynamic>),
                  )
                  .toList()
              : null;

  Map<String, dynamic> toJson() => {
    'collectionName': collectionName,
    'collectionSalePrice': collectionSalePrice?.map((e) => e.toJson()).toList(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionChartData &&
          runtimeType == other.runtimeType &&
          collectionName == other.collectionName &&
          ListEquality().equals(collectionSalePrice, other.collectionSalePrice);

  @override
  int get hashCode => collectionName.hashCode ^ collectionSalePrice.hashCode;
}
