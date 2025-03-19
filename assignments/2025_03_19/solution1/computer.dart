import 'abstract/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required this.makerName,
    required super.name,
    required super.color,
    required super.price,
    required super.weight,
  });
}
