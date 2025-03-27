import 'package:intl/intl.dart';

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice.name(this.price, this.cvtDatetime);

  Map<String, dynamic> toJson() {
    return {"price" : price, "cvtDatetime" : DateFormat("yyyy-MM-ddT-HH:mm:ss").format(cvtDatetime)};
  }

  CollectionSalePrice.fromJson(Map<String, dynamic> json):
      price = json["price"], cvtDatetime = DateTime.parse(json["cvtDatetime"]);
}