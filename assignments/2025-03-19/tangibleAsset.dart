import 'package:modu_3_dart_study/2025-03-19/asset.dart';
import 'package:modu_3_dart_study/2025-03-19/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight;

  TangibleAsset({required super.name, required super.price, required this.color, required double weight}): _weight = weight;

  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    _weight = value;
  }
}