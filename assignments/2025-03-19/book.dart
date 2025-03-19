import 'tangible_asset.dart';

class Book extends TangibleAsset {
  String makerName;

  Book(
    super._weight, {
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
  });
}
