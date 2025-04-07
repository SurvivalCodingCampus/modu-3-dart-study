import 'wizard.dart';

class GreatWizard extends Wizard {
  @override
  int mp;

  GreatWizard({
    required super.hp,
    required super.name,
    required super.wand,
    required this.mp,
  });

  void superHeal(Hero hero) {
    @override
    int maxmp = 150;

    if (mp < 50) {
      print("마나가 부족합니다");
      return;
    }

    if (hero.hp == hero.maxHp) {
      print("이미 HP는 전부 회복 되었습니다");
      return;
    }

    mp -= 50;
    hero.hp = hero.maxHp;
    print("슈퍼 힐을 시전했습니다. 대상 HP : ${hero.hp}");
  }
}
