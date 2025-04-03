import '../2025-03-13/hero.dart';
import '../2025-03-17/wizard.dart';

class GreatWizard extends Wizard {
  GreatWizard(String name) : super(name, 100, 150);

  void superHeal(Hero hero) {
    if (mp < 50) {
      print('마나가 부족합니다');
      return;
    }
    hero.hp = hero.maxHp;
    mp -= 50;

    print("슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}");
  }
}

void main() {
  Hero hero = Hero(name: '홍길동', hp: 50);
  GreatWizard wizard = GreatWizard('간달프');

  wizard.superHeal(hero);
  // 출력: 슈퍼 힐을 시전했습니다. 대상 HP: 100

  wizard.superHeal(hero);
  wizard.superHeal(hero);
  wizard.superHeal(hero);
  // 3번 시전 후: 마나가 부족합니다
}