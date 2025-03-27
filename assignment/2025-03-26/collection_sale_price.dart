import 'package:intl/intl.dart';

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice({required this.price, required this.cvtDatetime});

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'] as double,
      cvtDatetime = DateTime.parse(json['cvtDatetime']);

  Map<String, dynamic> toJson() => {
    'price': price,
    'cvtDatetime': cvtDatetime.toIso8601String(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionSalePrice &&
          runtimeType == other.runtimeType &&
          price == other.price &&
          cvtDatetime == other.cvtDatetime;

  @override
  int get hashCode => price.hashCode ^ cvtDatetime.hashCode;
}
