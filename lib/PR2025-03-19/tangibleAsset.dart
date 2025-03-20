import 'package:modu_3_dart_study/PR2025-03-19/asset.dart';
import 'package:modu_3_dart_study/PR2025-03-19/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String name;
  int price;
  String color;

  //Thing에서는 public으로 weight를 처리하지만 실제 저장소인 TangibleAsset에서는 private를 사용해 캡슐화
  //생성자에서 weight를 선언 안하기때문에 값 초기화
  double _weight = 0;

  // Thing을 implements햇기 때문에 weight의 getter를 오버라이딩
  @override
  double get weight => _weight;

  // Thing을 implements햇기 때문에 weight의 setter를 오버라이딩
  @override
  set weight(double value) {
    if (value < 0) {
      value = 0;
      throw Exception('무게는 0보다 작을 수 없습니다.');
    }
    _weight = value;
  }

  @override
  void printWeight() {
    print('위 제품의 무게는 $weight입니다.');
  }

  //Asset의 메서드 getDiscount활용후 할인된 값 출력하는 새로운 메서드
  void printSale() {
    int discountedPrice = getDiscount(price);
    print('$name의 할인된 가격은 $discountedPrice 입니다.');
  }

  TangibleAsset({
    required this.name,
    required this.price,
    required this.color,
    required super.amount,
  });
}
