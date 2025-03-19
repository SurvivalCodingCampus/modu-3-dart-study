import 'package:modu_3_dart_study/2025-03-19/Thing.dart';

abstract class Assets {
  String name;
  int price;
  String patent;

  Assets({required this.name, required this.price, required this.patent});
}

abstract class IntangibleAsset extends Assets {
  IntangibleAsset({
    required super.name,
    required super.price,
    required super.patent,
  });
}

abstract class TangibleAsset extends Assets implements Thing {
  String color;
  @override
  double weight;

  TangibleAsset({
    required super.name,
    required super.price,
    required super.patent,
    required this.color,
    required this.weight,
  });
}
