import 'package:modu_3_dart_study/2025-03-18/wizard.dart';
import 'package:modu_3_dart_study/2025-03-18/hero.dart';

class GreatWizard extends Wizard {
  static const greatWizardMaxMP = 150;

  GreatWizard({
    required super.name,
    required super.hp,
    super.mp = greatWizardMaxMP,
    super.wand,
  });

  void superHeal(Hero hero) {
    if (mp < 50) {
      print('마나가 부족합니다');
    } else {
      mp -= 50;
      hero.hp = Hero.heroMaxHP;
      print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }
}
