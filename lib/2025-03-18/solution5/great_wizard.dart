
import '../core/hero.dart';
import '../solution4/wizard.dart';

class GreatWizard extends Wizard {
  static const int defaultMaxMp = 150;
  static const int defaultSkillPtSuperHeal = 50;

  GreatWizard(String name, {int? mp} ) : super(name: name, hp: Wizard.defaultMaxHp, mp: mp ?? defaultMaxMp, maxMp: defaultMaxMp);


  void superHeal(Hero hero) {

    if (mp < GreatWizard.defaultSkillPtSuperHeal) {
      print('마나가 부족합니다 (현재마나 : $mp)');
      return;
    }

    hero.hp = Hero.maxHp;

    // 마나 감소 (음수값 유효성 검사)
    int resultMp = mp - defaultSkillPtSuperHeal;
    mp = resultMp > 0 ? resultMp : 0;


    print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }


  @override
  set mp(int value) {
    // TODO: implement mp
    super.mp = value;
  }
}