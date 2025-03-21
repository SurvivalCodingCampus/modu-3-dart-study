// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;
  int page = 100;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required this.isbn,
  });
}
