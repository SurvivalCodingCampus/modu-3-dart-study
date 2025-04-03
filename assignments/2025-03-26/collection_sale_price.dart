class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice({required this.price, required this.cvtDatetime});

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cvtDatetime': cvtDatetime.toIso8601String().split('.').first,
    };
  }

  // 역직렬화
  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'], // toDouble
      cvtDatetime = DateTime.parse(json['cvtDatetime']); // string -> Datetime

  @override
  String toString() =>
      'CollectioSalePrice(price: $price, cvtDatetime: $cvtDatetime)';
}
