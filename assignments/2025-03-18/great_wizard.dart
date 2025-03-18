import 'package:modu_3_dart_study/2025-03-14/hero.dart';

import '../2025-03-17/wand.dart';
import 'wizard.dart';

class GreatWizard extends Wizard {
  GreatWizard({required String name, required int hp, int mp = 150, Wand? wand})
    : super(name: name, hp: hp, mp: mp, wand: wand);

  void superHeal(Hero hero) {
    if (this.mp < 50) {
      print("마나가 부족합니다");
      return;
    }

    this.mp -= 50;
    hero.hp = Hero.maxHp;

    print("슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}");
  }
}
