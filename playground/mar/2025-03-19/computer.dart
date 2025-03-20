import 'tangibleAsset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
    required super.weight,
  });


  @override
  void identify() {
    print('$name용 컴퓨터, 가격 : $price, 제조사 : $makerName, 무게 : $weight kg');
  }
}
