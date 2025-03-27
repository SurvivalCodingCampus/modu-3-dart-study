import 'package:intl/intl.dart';

class CollectionChartDataList {
  List<Collection>? collection;

  Map<String, dynamic> toJson() {
    return {
      "collectionChartDataList": collection?.map((e) => e.toJson()).toList(),
    };
  }

  CollectionChartDataList.fromJson(Map<String, dynamic> json)
    : collection =
          (json['collectionChartDataList'] as List?)
              ?.map((e) => Collection.fromJson(e))
              .toList();

  @override
  String toString() {
    return 'CollectionChartDataList{collection: $collection}';
  }
}

class Collection {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  Collection(this.collectionName, this.collectionSalePrice);

  Map<String, dynamic> toJson() {
    return collectionSalePrice == null
        ? {"collectionName": collectionName}
        : {
            "collectionName": collectionName,
            "collectionSalePrice":
                collectionSalePrice?.map((e) => e.toJson()).toList(),
          };
  }

  Collection.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'],
      collectionSalePrice =
          (json['collectionSalePrice'] as List?)
              ?.map((e) => CollectionSalePrice.fromJson(e))
              .toList();

  @override
  String toString() {
    return 'Collection{collectionName: $collectionName, collectionSalePrice: $collectionSalePrice}';
  }
}

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice(this.price, this.cvtDatetime);

  Map<String, dynamic> toJson() {
    return {
      "price": price,
      "cvtDatetime":
          DateFormat('yyyy-MM-ddTHH:mm:ss').format(cvtDatetime).toString(),
    };
  }

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = DateTime.parse(json['cvtDatetime']); // Iso8601 변환

  @override
  String toString() {
    return 'CollectionSalePrice{price: $price, cvtDatetime: $cvtDatetime}';
  }
}
