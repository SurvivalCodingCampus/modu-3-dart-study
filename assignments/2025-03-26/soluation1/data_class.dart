class ChatData {
  String name;
  List salePrice;

  ChatData({required this.name, required this.salePrice});

  @override
  String toString() {
    // TODO: implement toString
    return 'ChatData{name : ${this.name.toString()}, salePrice : ${this.salePrice}, ';
  }

  Map<String, dynamic> toJson() {
    return {'collectionName': name, 'collectionSalePrice': salePrice};
  }

  ChatData.fromJson(Map<String, dynamic> json)
    : name = json["collectionName"],
      salePrice = json["collectionSalePrice"];
}
