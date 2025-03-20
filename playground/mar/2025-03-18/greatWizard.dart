import '../../../lib/mar/2025-03-17/wizard2.dart';

import 'hero.dart';

class GreatWizard extends Magician {
  static const int greatMaxMp = 150;

  GreatWizard({required super.name}) {
    mp = greatMaxMp;
  }

  void superHeal(Hero hero) {
    if (mp < 50) {
      print('마나가 부족합니다.');
    } else {
      mp -= 50;
      hero.hp = Hero.maxHp;
      print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }
}
