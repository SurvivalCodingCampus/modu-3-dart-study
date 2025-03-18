import 'hero.dart';
import 'wizard.dart';

class GreatWizard extends Wizard {
  static const int maxMp = 150;

  GreatWizard(super.name) {
    mp = maxMp;
  }

  void superHeal(Hero target) {
    const int mpCost = 50;

    if (mp >= mpCost) {
      target.hp = Hero.maxHp;
      mp -= 50;
    }
  }
}
