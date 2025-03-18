import 'dart:math';

import '../2025-03-18/hero.dart';

class Wizard {
  final maxMp = 100; // 최대 Mp
  final int _usedMp = 10; // 소모 마나
  final int _healedHp = 20; // 힐량
  // late 선언
  // -> 생성자에서 무조건 할당이 되도록 선언
  late int mp;

  Wizard(){
    mp = maxMp;
  }

  void heal(Hero hero) {
    if (mp < _usedMp) {
      print("마나가 부족합니다.");
      return;
    }
    hero.hp = min(_healedHp + hero.hp, Hero.maxHp);
    mp -= _usedMp;
    print("힐을 시전했습니다. 대상 HP: ${hero.hp}");
  }
}

class GreatWizard extends Wizard {
  @override
  int get maxMp => 150; // 최대 마나
  @override
  int get _usedMp => 50; // 소모 마나
  @override
  int get _healedHp => Hero.maxHp; // 힐량

  void superHeal(Hero hero) {
    super.heal(hero);
  }
}
