import 'package:modu_3_dart_study/2025-03-19/Thing.dart';

abstract class Assets {
  String name;
  int price;
  String parent;

  Assets({required this.name, required this.price, required this.parent});
}

abstract class IntangibleAsset extends Assets {
  IntangibleAsset({required super.name, required super.price, required super.parent});
}


abstract class TangibleAsset extends Assets implements Thing {
  String color;
  @override double weight;
  TangibleAsset({required super.name, required super.price, required super.parent, required this.color, required this.weight});
}