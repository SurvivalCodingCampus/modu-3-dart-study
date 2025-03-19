abstract interface class Thing {
  set weight(double value);
}

abstract class Asset {}

class TangibleAsset extends Asset implements Thing {
  double _weight = 0;
  String name;
  int price;
  String color;

  TangibleAsset(this.name, this.price, this.color);

  @override
  set weight(double value) {
    if (value < 0) return;

    _weight = value;

    print("무게는 $value 입니다");
  }
}

class IntangibleAsset extends Asset {}

class Computer extends TangibleAsset {
  String makerName;

  Computer(this.makerName, super.name, super.price, super.color);
}

class Book extends TangibleAsset {
  String isbn;

  Book(this.isbn, super.name, super.price, super.color);
}

class Patent extends IntangibleAsset {}
