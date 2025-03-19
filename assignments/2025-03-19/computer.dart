import 'tangible_asset.dart';

class Computer extends TangibleAsset {
  String isbn;

  Computer(
    super._weight, {
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });
}
