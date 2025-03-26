class CollectionCharDataList {
  List<CollectionData> collectionCharDataList;

  CollectionCharDataList({required this.collectionCharDataList});

  CollectionCharDataList.fromJson(Map<String, dynamic> json)
      : collectionCharDataList = [] {
    final rawList = json['collectionChartDataList'];
    if (rawList is List) {
      for (var item in rawList) {
        collectionCharDataList.add(CollectionData.fromJson(item));
      }
    }
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> chartDataList = [];
    for (var item in collectionCharDataList) {
      chartDataList.add(item.toJson());
    }
    return {
      'collectionCharDataList': chartDataList};
  }
}

class CollectionData {
  String collectionName;
  List<CollectionSalePrice> collectionSalePrice;

  CollectionData({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  CollectionData.fromJson(Map<String, dynamic> json)
      : collectionName = json['collectionName'],
        collectionSalePrice = [] {
    final rawPrices = json['collectionSalePrice'];
    for (var priceJson in rawPrices) {
      collectionSalePrice.add(CollectionSalePrice.fromJson(priceJson));
    }
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> saleList = [];
    for (var item in collectionSalePrice) {
      saleList.add(item.toJson());
    }

    return {'collectionName': collectionName, 'collectionSalePrice': saleList};
  }
}

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice({required this.price, required this.cvtDatetime});

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
      : price = json['price'],
        cvtDatetime = json['cvtDatetime'];

  Map<String, dynamic> toJson() {
    return {'price': price, 'cvtDatetime': cvtDatetime};
  }
}
