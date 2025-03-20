import 'asset.dart';
import 'thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight; //Thing 인터페이스에서 제공할 Weight

  TangibleAsset({
    required super.name,
    required super.price,
    required this.color,
    required double weight
  }) : _weight = weight;

  @override
  set weight(double value) {
    // 추상적인 setter 메서드 정의
    if (value >=0) {
      _weight = value;
    } else {
      throw ArgumentError("무게는 0 이상어어야 합니다.");
    }
  }

  @override
  double get weight => _weight;   // 추상적인 getter 메서드 정의

}
