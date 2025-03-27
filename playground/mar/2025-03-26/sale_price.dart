class SalePrice {
  double price;
  DateTime cvtDatetime;

  SalePrice({required this.price, required this.cvtDatetime});

  Map<String, dynamic> toJson() {
    return {'price': price, 'cvtDatetime': cvtDatetime};
  }

  SalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = DateTime.parse(json['cvtDatetime']);

  @override
  String toString() {
    return 'SalePrice{price: $price, cvtDatetime: $cvtDatetime}';
  }
}
