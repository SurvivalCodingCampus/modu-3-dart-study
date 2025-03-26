import 'package:intl/intl.dart';

class SalePrice {
  double price;
  DateTime cvtDateTime;

  SalePrice({required this.price, required this.cvtDateTime});

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cvtDatetime': DateFormat('yyyy-MM-ddThh:mm:ss').format(cvtDateTime),
    };
  }

  SalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDateTime = DateTime.parse(json['cvtDatetime']);

  @override
  String toString() {
    // TODO: implement toString
    return '{price: $price, cvtDateTime: $cvtDateTime}';
  }
}
