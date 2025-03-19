import 'hero.dart';
import 'wizard_modify.dart';

class GreatWizard extends WizardModify {

  void superHeal(Hero hero) {
    if (50 > power) {
      print('마나가 부족합니다');
      return;
    }

    hero.hp = 100;
    power -= 50;
    print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}