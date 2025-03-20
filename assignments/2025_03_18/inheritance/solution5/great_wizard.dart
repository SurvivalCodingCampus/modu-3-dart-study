import '../solution3/hero.dart';
import '../solution4/wizard.dart';

class GreatWizard extends Wizard {
  static const maxMp = 150;

  final useMp = 50;
  GreatWizard({required super.name, required super.hp, super.mp = maxMp});

  void superHeal(Hero hero) {
    if (mp < 50) {
      print('마나가 부족합니다.');
    }
    mp -= useMp;
    hero.hp = hero.maxHp;

    print('슈퍼 힐을 시전했습니다. ${hero.name} 의 HP : ${hero.hp}');
  }
}
