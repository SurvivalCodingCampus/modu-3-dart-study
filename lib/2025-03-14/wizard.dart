import 'package:modu_3_dart_study/2025-03-13/hero.dart';

/* 마법사 */
class Wizard {
  String name;
  int hp;

  Wizard({required this.name, required this.hp}) {
    print('$name(마법사)가 생성되었다. HP: $hp');
  }

  void heal(Hero hero) {
    hero.hp += 10;
    print('${hero.name}의 hp를 10 회복했습니다.');
  }
}
