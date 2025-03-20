import 'hero.dart';

class Wizard {
  static const int defaultMp = 100;
  static const int useHealMp = 10;
  static const int healAmount = 20;

  String name;
  int hp;
  int mp;

  Wizard({required this.name, required this.hp, this.mp = Wizard.defaultMp});

  void heal(Hero hero) {
    if (mp < Wizard.useHealMp) {
      print('마나가 부족합니다.');
      return;
    }

    hero.hp += Wizard.healAmount;
    mp -= Wizard.useHealMp;

    print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}
