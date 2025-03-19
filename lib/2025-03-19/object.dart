
import 'assets.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({required super.name, required super.price, required super.parent, required super.color, required this.isbn, required super.weight});
}

class Computer extends TangibleAsset {
  String makerName;
  Computer({required super.name, required super.price, required super.parent, required super.color, required this.makerName, required super.weight});
}


class Software extends IntangibleAsset {
  String platform;
  String store;

  Software({required super.name, required super.price, required super.parent, required this.platform, required this.store});
}