abstract class TangibleAsset {
  String name;
  String price;
  String color;

  TangibleAsset({required this.name, required this.price, required this.color});
}

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });
}

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
  });
}
