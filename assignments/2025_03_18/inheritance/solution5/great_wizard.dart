import '../solution3/hero.dart';
import '../solution4/wizard.dart';

class GreatWizard extends Wizard {
  static const gwMaxMp = 150;
  GreatWizard({required super.name, required super.hp, super.mp = gwMaxMp});

  void superHeal({required Hero hero}) {
    if (mp < 50) {
      print('마나가 부족합니다.');
    }
    mp -= 50;
    hero.hp = hero.maxHp;

    print('슈퍼 힐을 시전했습니다. ${hero.name} 의 HP : ${hero.hp}');
  }
}
