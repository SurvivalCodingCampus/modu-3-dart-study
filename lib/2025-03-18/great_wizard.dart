class GreatWizard extends Wizard {
  GreatWizard({required String name, required int hp, required Wand? wand})
    : super(name: name, hp: hp, wand: wand);

  @override
  set mp(int _mp) {
    super.mp = _mp;
    super.mp = 150;
  }

  @override
  void heal(Hero hero) {
    super.heal(hero);
    final int superHealCost = 40;
    if (superHealCost <= mp) {
      hero.hp = hero.maxHp;
      print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
      mp -= superHealCost;
    } else {
      print('마나가 부족합니다.');
    }
  }
}
