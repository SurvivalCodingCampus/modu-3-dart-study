import 'hero.dart';
import 'wizard.dart';

class GreatWizard extends Wizard {
  static const int maxMp = 150;

  int _mp;

  GreatWizard(super.name) : _mp = maxMp;

  void superHeal(Hero target) {
    const int mpCost = 50;

    if (mp >= mpCost) {
      target.hp = Hero.maxHp;
      mp -= mpCost;
    }
  }

  @override
  set mp(int value) {
    if (value < Hero.minMp) {
      _mp = 0;
    } else if (value > maxMp) {
      _mp = maxMp;
    } else {
      _mp = value;
    }
  }
}
