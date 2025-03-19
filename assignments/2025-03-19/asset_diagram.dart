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

  Computer(this.makerName);
}

class Book extends TangibleAsset {
  String isbn;

  Book(this.isbn);
}

class Patent extends IntangibleAsset {}
