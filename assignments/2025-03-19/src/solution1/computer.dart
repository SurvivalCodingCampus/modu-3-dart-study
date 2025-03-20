import 'tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.name,
    required super.color,
    required super.price,
    required super.weight,
    required this.makerName,
  });
}
