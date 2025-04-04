import '../2025-03-17/wizard.dart';
import 'hero.dart';

class GreatWizard extends Wizard {
  static const hasNoMpMsg = '마나가 부족합니다';
  static const maxMp = 150;
  static const superHealCost = 50;

  static superHealMsg(int hp) => '슈퍼힐을 시전했습니다. 대상 HP: $hp';

  GreatWizard(super.name, super.hp, {super.mp = maxMp, super.wand});

  void superHeal(Hero hero) {
    if (mp < superHealCost) {
      print(hasNoMpMsg);
    } else {
      hero.hp = Hero.maxHp;
      mp -= superHealCost;
      print(superHealMsg(hero.hp));
    }
  }
}
