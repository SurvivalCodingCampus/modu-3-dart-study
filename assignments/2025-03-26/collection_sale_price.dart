class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = DateTime.parse(json['cvtDatetime']);

  @override
  String toString() {
    return 'price : $price, cvtDatetime : $cvtDatetime';
  }
}