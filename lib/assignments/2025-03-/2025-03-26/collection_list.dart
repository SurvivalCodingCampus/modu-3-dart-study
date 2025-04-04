class CollectionList {
  final List<Collection> collectionChartDataList;

  CollectionList.fromJson(Map<String, dynamic> json)
    // List<dynamic>으로 설정 후
    // 각 리스트 내부 Map<String, dynamic>에 대해
    // 내부 객체의 fromJson
    : collectionChartDataList =
          ((json['collectionChartDataList'] as List<dynamic>).map(
            (e) => Collection.fromJson(e),
          )).toList();
}

class Collection {
  final String collectionName;
  final List<CollectionSalePrice>? collectionSalePrice;

  Collection.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'],
      // List<dynamic>으로 설정 후
      // 각 리스트 내부 Map<String, dynamic>에 대해
      // 내부 객체의 fromJson
      
      // + null 인 값이 하나 존재해서 null일 경우의 로직 추가
      collectionSalePrice = json['collectionSalePrice'] == null ? null :
          (json['collectionSalePrice'] as List<dynamic>)
              .map((e) => CollectionSalePrice.fromJson(e))
              .toList();
}

class CollectionSalePrice {
  final double price;
  final DateTime cvtDatetime;

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      // file에서 데이터 가져올 땐 String으로 가져와서
      // DateTime으로 파싱
      cvtDatetime = DateTime.parse(json['cvtDatetime']);
}
