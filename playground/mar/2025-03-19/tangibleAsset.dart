import 'asset.dart';
import 'thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  // String name;
  // int price;
  String color;
  double _weight;

  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    if (value < 0) {
      throw Exception('무게를 다시 측정하세요');
    }
    _weight = value;
  }

  TangibleAsset({
    required super.name,
    required super.price,
    required this.color,
    required double weight,
  }) : _weight = weight;
}
