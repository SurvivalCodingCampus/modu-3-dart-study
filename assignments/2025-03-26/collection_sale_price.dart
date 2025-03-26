class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice(this.price, this.cvtDatetime);

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = DateTime.parse(json['cvtDatetime']);

  @override
  String toString() {
    return 'price : $price, cvtDatetime : $cvtDatetime';
  }

  Map<String, dynamic> toJson(CollectionSalePrice data) {
    return {'price': data.price, 'cvtDatetime': data.cvtDatetime};
  }
}
