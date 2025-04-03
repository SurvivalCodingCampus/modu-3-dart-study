import 'tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book(
    super.weight, {
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });
}
