import 'package:modu_3_dart_study/2025-03-14/sword.dart';
import 'package:modu_3_dart_study/2025-03-18/slime.dart';

class Hero {
  static const heroMaxHP = 100;
  final String name;
  int hp;

  void attack(Slime slime) {}
  void run() {}

  Hero({required this.name, this.hp = heroMaxHP});
}