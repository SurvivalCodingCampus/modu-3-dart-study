import 'package:modu_3_dart_study/2025-03-19/combined_version.dart';

class Book extends TangibleAsset {
  String isbn;

  Book(super.name, super.price, super.color, super.weight, this.isbn);
}