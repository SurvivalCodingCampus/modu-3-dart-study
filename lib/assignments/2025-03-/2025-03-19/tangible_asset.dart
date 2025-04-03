import 'asset.dart';
import 'thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  double _weight;
  String color;

  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    if (value < 0) {
      throw Exception("유형자산의 무게는 0보다 커야합니다.");
    }
    _weight = value;
  }

  TangibleAsset(
    this._weight, {
    required super.name,
    required super.price,
    required this.color,
  });
}
