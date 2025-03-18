import 'package:modu_3_dart_study/PR2025-03-18/hero.dart';
import 'package:modu_3_dart_study/PR2025-03-18/wizardFix.dart';

class GreatWizard extends Wizard {
  GreatWizard({required super.name, required super.hp, required super.mp});

  int mp = 150;

  void superHeal(Hero hero) {
    if (mp < 50) {
      print('마나가 부족합니다');
    } else {
      mp -= 50;
      hero.hp = hero.maxHp;
      print('슈퍼 힐을 시전했습니다. 대상 HP : ${hero.hp}');
    }
  }
}
