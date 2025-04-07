class SalePrice {
  final double price;
  final DateTime cvtDatetime;

  SalePrice(this.price, this.cvtDatetime);

  SalePrice.fromJson(Map<String, dynamic> json)
    : price = json["price"],
      cvtDatetime = DateTime.parse(json["cvtDatetime"]);
}

class ChartData {
  final String collectionName;

  //원본에 collectionSalePrice이곳은 List 형식으로 저장되어있어 List형식으로 선언
  final List<SalePrice> collectionSalePrice;

  ChartData(this.collectionName, this.collectionSalePrice);

  ChartData.fromJson(Map<String, dynamic> json)
    : collectionName = json["collectionName"],
      //값을 리스트 형태로 역직렬화, 중요한 구조
      collectionSalePrice =
          (json["collectionSalePrice"] as List)
              .map((item) => SalePrice.fromJson(item))
              .toList();
}
