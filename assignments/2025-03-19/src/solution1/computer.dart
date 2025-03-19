import 'package:modu_3_dart_study/2025-03-19/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, super.color, super.price, this.makerName);
}