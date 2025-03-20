abstract class TangibleAsset {
  String name;
  int price;
  String color;

  TangibleAsset({required this.name, required this.price, required this.color});
}

class Book extends TangibleAsset {
  String isbn;

  Book(this.isbn, String name, int price, String color)
    : super(name: name, price: price, color: color);
}

class Computer extends TangibleAsset {
  String makerName;

  Computer(this.makerName, String name, int price, String color)
    : super(name: name, price: price, color: color);
}
