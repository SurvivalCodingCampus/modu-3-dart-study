abstract interface class Thing {
  double get weight;

  set weight(double w);
}

abstract class Asset {
  String name;
  int price;

  Asset(this.name, this.price);
}

abstract class IntangibleAsset extends Asset {
  String owner;

  IntangibleAsset(super.name, super.price, this.owner);
}

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight;

  TangibleAsset(super.name, super.price, this.color, double weight)
    : _weight = weight;

  @override
  double get weight => _weight;

  @override
  set weight(double w) {
    _weight = w;
  }
}

class Patent extends IntangibleAsset {
  String patentNumber;

  Patent(super.name, super.price, super.owner, this.patentNumber);
}

class Book extends TangibleAsset {
  String isbn;

  Book(super.name, super.price, super.color, super.weight, this.isbn);
}

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, super.price, super.color, super.weight, this.makerName);
}
