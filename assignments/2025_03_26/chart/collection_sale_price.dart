class CollectionSalePrice {
  final double price;
  final DateTime cvtDatetime;

  CollectionSalePrice({required this.price, required this.cvtDatetime});

  Map<String, dynamic> toJson() {
    return {'price': price, 'cvtDatetime': cvtDatetime};
  }

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = DateTime.parse(json['cvtDatetime']);

  @override
  String toString() {
    return 'price : $price, cvtDatetime : $cvtDatetime';
  }
}
