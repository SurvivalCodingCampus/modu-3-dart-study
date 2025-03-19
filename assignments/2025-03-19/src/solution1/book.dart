import 'package:modu_3_dart_study/2025-03-19/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book(super.name, super.color, super.price, this.isbn);

  @override
  // TODO: implement weight
  int get weight => throw UnimplementedError();
}