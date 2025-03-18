import 'hero.dart';
import 'wizard.dart';

class GreatWizard extends Wizard {
  static const int maxMp = 150;

  int _mp;

  GreatWizard(super.name) : _mp = maxMp;

  void superHeal(Hero target) {
    const int mpCost = 50;

    if (_mp >= mpCost) {
      target.hp = Hero.maxHp;
      _mp -= mpCost;
    }
  }

  @override
  set mp(int value) {
    if (value < Hero.minMp) {
      _mp = 0;
    } else if (value > GreatWizard.maxMp) {
      _mp = maxMp;
    } else {
      _mp = value;
    }
  }

  @override
  int get mp => _mp;
}
