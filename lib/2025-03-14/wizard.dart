import 'package:modu_3_dart_study/2025-03-14/new_hero.dart';

class Wizard {
  String name;
  int hp;

  Wizard({required this.name, required this.hp});

  void heal(NewHero hero) {
    hero.hp += 10;
    print('힐을 했습니다.');
  }
}
