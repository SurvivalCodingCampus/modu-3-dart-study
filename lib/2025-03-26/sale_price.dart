class SalePrice {
  double price;
  DateTime dateTime;

  SalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      dateTime = DateTime.parse(json['cvtDatetime']);

  @override
  String toString() {
    return 'SalePrice{price: $price, dateTime: $dateTime}';
  }
}
