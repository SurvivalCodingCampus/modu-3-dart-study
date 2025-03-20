import 'tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, super.price, super.color, super.weight, this.makerName);
}
