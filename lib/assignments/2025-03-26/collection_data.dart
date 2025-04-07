import 'collection_sale_price.dart';

class CollectionData {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  CollectionData({required this.collectionName, this.collectionSalePrice});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {'collectionName': collectionName};

    if (collectionSalePrice != null) {
      result['collectionSalePrice'] =
          collectionSalePrice?.map((e) => e.toJson()).toList();
      // map 함수: 리스트에 있는 각요소를 가져옴,,e에 담김 각 요소를 toJson 객체-> map 형태로 만들고
      // .toList() 사용해서 다시 리스트로 만들기..ㄷㄷ
    } // null 일때는 담지도 않음,,,

    return result;
  }

  // 역직렬화
  CollectionData.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'],
      collectionSalePrice =
          (json['collectionSalePrice'] as List?)
              ?.map((e) => CollectionSalePrice.fromJson(e))
              .toList();

  @override
  String toString() =>
      'CollectionData(collectionName: $collectionName, collectionSalePrice: $collectionSalePrice)';
}
