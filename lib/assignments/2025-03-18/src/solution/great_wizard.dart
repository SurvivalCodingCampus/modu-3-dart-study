import '../../../2025-03-18/src/solution/wizard.dart';
import 'hero.dart';
import 'poison_slime.dart';

class GreatWizard extends Wizard {
  GreatWizard({required super.name, required super.hp}) {
    mp = 150;
  }

  void superHeal({required Hero hero}) {
    if (mp < 50) {
      // 본인의 mp가 50보다 작은 경우 힐 불가능
      print('마나가 부족합니다...');
    } else {
      hero.hp = Hero.maxHp;
      mp -= 50;
      print('슈퍼 힐을 시전했습니다. 대상 HP:${hero.hp}');
    }
  }
}

void main() {
  final poisonSlime = PoisonSlime('A');
  final greatWizard = GreatWizard(name: '테스트', hp: 100);
  final hero = Hero(name: '홍길동');

  poisonSlime.attack(hero);

  greatWizard.superHeal(hero: hero);
}
