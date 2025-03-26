import 'package:intl/intl.dart';

final _dateFormatter = DateFormat('yyyy-MM-ddTHH:mm:ss');

class SalePrice {
  final double? price;
  final DateTime? cvtDatetime;

  const SalePrice({this.price, this.cvtDatetime});

  SalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'] != null ? (json['price'] as num).toDouble() : null,
      cvtDatetime =
          json['cvtDatetime'] != null
              ? DateTime.tryParse(json['cvtDatetime'])
              : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (price != null) data['price'] = price;
    if (cvtDatetime != null) {
      data['cvtDatetime'] = _dateFormatter.format(cvtDatetime!);
    }
    return data;
  }
}
