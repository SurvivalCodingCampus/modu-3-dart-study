class SalePrice {
  double price;
  String cvtDatetime;

  SalePrice({required this.price, required this.cvtDatetime});

  // 역직렬화 Json 데이터를 SalePrice 객체로 변환
  SalePrice.fromJson (Map<String, dynamic> json)
    : price = json['price'] as double,
      cvtDatetime = json['cvtDatetime'] as String;

  // 직렬화 SalePrice 객체를 Json 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cvtDateTime' : cvtDatetime
    };
  }

}
