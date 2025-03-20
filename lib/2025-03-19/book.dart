import 'package:modu_3_dart_study/2025-03-19/tangible_asset.dart';

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
