class SalePrice {
  final double price;
  final DateTime cvtDateTime;

  SalePrice(this.price, DateTime? cvtDateTime)
    : cvtDateTime = cvtDateTime ?? DateTime.now();

  Map<String, dynamic> toJson() => {'price': price, 'cvtDatetime': cvtDateTime};
  SalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDateTime = DateTime.parse(json['cvtDatetime']);

  @override
  String toString() {
    return '{price : $price, cvtDateTime : $cvtDateTime}';
  }
}
