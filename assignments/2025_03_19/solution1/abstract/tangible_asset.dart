import '../../solution3/thing.dart';
import '../../solution4/asset.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight;

  TangibleAsset({
    required this.color,
    required super.name,
    required super.price,
    required double weight,
  }) : _weight = weight;

  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    _weight = value;
  }
}
