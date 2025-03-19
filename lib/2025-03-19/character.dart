// 추상클래스와 추상메서드
import 'package:modu_3_dart_study/2025-03-14/slime.dart';

abstract class Character {
  String name;
  int hp;

  Character({required this.name, required this.hp});

  void run();

  void attack(Slime slime);
}
