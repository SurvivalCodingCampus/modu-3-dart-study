import 'package:modu_3_dart_study/2025-03-19/combined_version.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight;

  TangibleAsset(super.name, super.price, this.color, double weight)
      : _weight = weight;

  @override
  double get weight => _weight;

  @override
  set weight(double w) {
    _weight = w;
  }
}