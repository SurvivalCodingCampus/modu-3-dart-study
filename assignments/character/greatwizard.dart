import 'hero.dart';
import 'wizard.dart';

class GreatWizard extends Wizard {
  GreatWizard(name, hp, {int mp = 150}) : super(name, hp, mp);

  void superHeal(Hero hero) {
    if (mp >= 50) {
      hero.hp = Hero.maxHp;
      mp -= 50;
      print('슈퍼힐을 시전했습니다. 대상 HP: ${hero.hp}, 남은 MP: $mp');
    } else {
      print('마나가 부족합니다.');
    }
  }
}

void main() {
  Hero hero = Hero('토르', 100);
  GreatWizard greatWizard = GreatWizard('마법사', 100, mp: 150);
  greatWizard.superHeal(hero);
}
