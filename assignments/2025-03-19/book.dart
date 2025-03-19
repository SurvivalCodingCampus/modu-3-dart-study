import 'tangible_asset.dart';

class Book extends TangibleAsset {
  final String isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required this.isbn,
  });
}
