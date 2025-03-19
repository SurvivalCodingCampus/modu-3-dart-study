import 'hero.dart';
import 'dart:math';

class Wizard {
  String name;
  int mp = 100;

  Wizard(this.name);

  void heal(Hero hero) {
    if (mp < 10) {
      print('마나가 부족합니다');
      return;
    }

    hero.hp = min(hero.hp + 20, 10);
    mp -= 10;

    print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}
