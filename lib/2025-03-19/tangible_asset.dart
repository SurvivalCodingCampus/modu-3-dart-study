import 'package:modu_3_dart_study/2025-03-19/asset.dart';
import 'package:modu_3_dart_study/2025-03-19/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  final String _color;
  double _weight = 0.0;

  TangibleAsset({
    required super.name,
    required super.price,
    required String color,
  }) : _color = color;

  @override
  double get weight => _weight;

  String get color => _color;

  @override
  set weight(double weight) => _weight = weight < 0.0 ? 0.0 : weight;
}
