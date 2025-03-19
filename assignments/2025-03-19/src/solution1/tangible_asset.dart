import 'package:modu_3_dart_study/2025-03-19/asset.dart';
import 'package:modu_3_dart_study/2025-03-19/thing.dart';

abstract class TangibleAsset extends Asset implements Thing{
  String color;

  @override
  int weight; // weight 필드 추가

  TangibleAsset(super.name, super.price, this.color, this.weight);
}