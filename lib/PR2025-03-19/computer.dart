// Computer 클래스에만 있는 makerName변수 생성하고 생성자에 추
import 'tangibleAsset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
    required super.amount,
  });
}
