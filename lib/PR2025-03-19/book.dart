import 'package:modu_3_dart_study/PR2025-03-19/tangibleAsset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
    required super.amount,
  });
}
