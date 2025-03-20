import 'package:modu_3_dart_study/2025-03-18/inheritance.dart';

void main(List<String> args) {
  print(24.2.round());
  print(24.5.round());
  print(24.9.round());
}

abstract interface class Human {
  void speak();
}

abstract interface class Attackable {
  void attack(Slime slime);
}

class Book extends TangibleAsset {
  String isbn;

  Book(super.name, super.price, super.color, super.weight, this.isbn);
}

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, super.price, super.color, super.weight, this.makerName);
}

abstract interface class Thing {
  // property : 메소드의 일종
  double get weight;
  set weight(double value);
}

abstract class Asset {
  String name;
  int price;
  double _weight;

  Asset(this.name, this.price, double weight) : _weight = weight;
}

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  TangibleAsset(super.name, super.price, super.weight, this.color);

  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    _weight = value;
  }
}
