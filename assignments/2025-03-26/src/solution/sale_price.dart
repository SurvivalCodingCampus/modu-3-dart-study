import 'package:intl/intl.dart';

class SalePrice {
  double price;
  DateTime cvtDateTime;

  SalePrice({required this.price, required this.cvtDateTime});

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cvtDatetime': DateFormat('yyyy-MM-ddTHH:mm:ss').format(cvtDateTime),
    };
  }

  SalePrice.fromJson(Map<String, dynamic> json)
    : price =
          json['price'] is double
              ? json['price']
              : (json['price'] is int
                  ? (json['price'] as int).toDouble()
                  : 0.0),
      cvtDateTime =
          json.containsKey('cvtDatetime')
              ? DateTime.tryParse(json['cvtDatetime']) ?? DateTime.now()
              : DateTime.now();

  @override
  String toString() {
    // TODO: implement toString
    return '{price: $price, cvtDateTime: $cvtDateTime}';
  }
}
