import 'package:modu_3_dart_study/2025-03-19/tangible_asset.dart';

class Book extends TangibleAsset {
  final String _isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required String isbn,
  }) : _isbn = isbn;

  String get isbn => _isbn;
}
