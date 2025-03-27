import 'dart:convert';
import 'dart:io';

class SalePrice {
  double price;
  String cvtDatetime;

  SalePrice(this.price, this.cvtDatetime);

  SalePrice.fromJson(Map<String, dynamic> json)
    : price = json["price"] ?? 0.0,
      cvtDatetime = json["cvtDatetime"] ?? '';

  @override
  String toString() {
    // TODO: implement toString
    return 'SalePrice { price : $price, cvtDatetime : $cvtDatetime }';
  }
}

class ChatData {
  String name;
  SalePrice salePrice;

  ChatData({required this.name, required this.salePrice});

  ChatData.fromJson(Map<String, dynamic> json)
    : name = json["collectionName"],
      salePrice = (json["collectionSalePrice"].toList()).map(
        (e) => SalePrice.fromJson(e),
      );
}

class ChartDataList {
  ChatData chatData;

  ChartDataList({required this.chatData});
}

void main() {
  final jsonData = jsonDecode(
    File("lib/2025-03-26/soluation1/chart_data.json").readAsStringSync(),
  );

  final List dataList = jsonData["collectionChartDataList"];

  dataList.forEach((e) {});
}
