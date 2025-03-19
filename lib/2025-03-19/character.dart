
import 'package:modu_3_dart_study/2025-03-18/slime.dart';

abstract class Character {
  String name;
  int hp;

  Character({required this.name, required this.hp});

  void run() {

  }
  void attack(Slime slime);
}

class Hero extends Character {
  Hero({required super.name, required super.hp});

  @override
  void attack(Slime slime) {
    // TODO: implement attack
  }

}