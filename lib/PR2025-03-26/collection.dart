import 'dart:convert';
import 'dart:io';

class SalePrice {
  final double price;
  final DateTime cvtDatetime;

  SalePrice(this.price, this.cvtDatetime);

  SalePrice.fromJson(Map<String, dynamic> json)
    : price = json["price"],
      cvtDatetime = DateTime.parse(json["cvtDatetime"]);
}

class ChartData {
  final String collectionName;

  //원본에 collectionSalePrice이곳은 List 형식으로 저장되어있어 List형식으로 선언
  final List<SalePrice> collectionSalePrice;

  ChartData(this.collectionName, this.collectionSalePrice);

  ChartData.fromJson(Map<String, dynamic> json)
    : collectionName = json["collectionName"],
      //값을 리스트 형태로 변환
      collectionSalePrice =
          (json["collectionSalePrice"] as List)
              .map((item) => SalePrice.fromJson(item))
              .toList();
}

void main() {
  String fileAddress = 'lib/PR2025-03-26/chart_data.json';
  final file = File(fileAddress);

  final String jsonString =
      '''{"collectionName": "collection1","collectionSalePrice":  [{"price": 95.25, "cvtDatetime": "2023-03-26T08:24:40"},{"price": 95.50, "cvtDatetime": "2023-03-26T08:24:50"}]}''';
  final Map<String, dynamic> json = jsonDecode(jsonString);
  // ignore: unused_local_variable
  final ChartData chartData = ChartData.fromJson(json);
  final String readJsonString = file.readAsStringSync();
  print(readJsonString);
}
