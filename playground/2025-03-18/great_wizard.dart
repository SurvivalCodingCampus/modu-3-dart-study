import 'wizard.dart';

import '../game/hero.dart';

class GreatWizard extends Wizard {
  static const int defaultMp = 150;
  static const int superHealUseMp = 50;

  GreatWizard({required super.name, required super.hp, super.mp = defaultMp});

  void superHeal(Hero hero) {
    if (mp < superHealUseMp) {
      print('마나가 부족합니다.');
      return;
    }

    hero.hp = Hero.maxHp;
    mp -= superHealUseMp;

    print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}
