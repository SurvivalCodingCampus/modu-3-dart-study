import 'asset.dart';
import 'thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight; // private 필드로 선언

  TangibleAsset({
    required String name,
    required int price,
    required this.color,
    required double weight,
  }) : _weight = weight,
       super(name: name, price: price);

  @override
  double get weight => _weight;

  @override
  set weight(double weight) {
    _weight = weight;
  }
}
