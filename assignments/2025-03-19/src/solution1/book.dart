import 'tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.name,
    required super.color,
    required super.price,
    required super.weight,
    required this.isbn,
  });
}
