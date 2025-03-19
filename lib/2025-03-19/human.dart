import 'package:modu_3_dart_study/2025-03-19/slime.dart';

import 'hero.dart';

abstract interface class Human {
  String name;
  final int _age;

  Human(this.name, this._age);

  int get age => _age;

  void speak();
}

abstract interface class Attackable {
  void attack(Slime target);
}

abstract interface class Healable {
  void heal(Hero target);
}

abstract interface class Moveable {
  void move(Hero target);
}
