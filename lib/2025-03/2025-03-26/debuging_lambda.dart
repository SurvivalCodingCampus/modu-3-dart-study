import 'dart:convert';



void main() {
  final String json = '''{
 "collectionChartDataList": [
   {
     "collectionName": "collectionName",
     "collectionSalePrice": null
   },
   {
     "collectionName": "collectionName",
     "collectionSalePrice": [
       {
         "price": 59.75,
         "cvtDatetime": "2023-03-26T08:08:35"
       },
       {
         "price": 60.00,
         "cvtDatetime": "2023-03-26T08:08:45"
       }
     ]
   }
 ]
}''';
  Map<String, dynamic> jsonMap = jsonDecode(json);
  print(jsonMap['collectionChartDataList'].runtimeType);
  print(jsonMap['collectionChartDataList'][0].runtimeType);

  for (Map<String, dynamic> data in jsonMap['collectionChartDataList']) {
    print(CollectionChartData.fromJson(data));
  }
}

class CollectionChartData {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;
  CollectionChartData(this.collectionName, this.collectionSalePrice);

  CollectionChartData.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'],
      collectionSalePrice =
          json['collectionSalePrice'] == null
              ? null
              : (json['collectionSalePrice'] as List).map((e) {
                return CollectionSalePrice.fromJson(e);
              }).toList();

  @override
  String toString() {
    return 'collectionName : $collectionName, collectionSalePrice : $collectionSalePrice';
  }
}

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = DateTime.parse(json['cvtDatetime']);

  @override
  String toString() {
    return 'price : $price, cvtDatetime : $cvtDatetime';
  }
}
