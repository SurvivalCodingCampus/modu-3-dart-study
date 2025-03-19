import 'abstract/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required this.isbn,
    required super.name,
    required super.color,
    required super.price,
    required super.weight,
  });
}
