import 'hero.dart';

class Wizard extends Hero {
  Wizard(super.name);

  void heal(Hero target) {
    const int mpCost = 10;
    const int hpRecovery = 20;

    if (mp >= mpCost) {
      target.hp += hpRecovery;
      mp -= mpCost;
    }
  }
}
