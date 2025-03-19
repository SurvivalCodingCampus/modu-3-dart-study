import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/wand.dart';
import '../../assignments/2025-03-18/wizard.dart';

class GreatWizard extends Wizard {
  static const int increasedMP = 150;


  // MP 기본값을 150으로 설정
  GreatWizard({required super.name, required super.hp,super.wand})
  : super(mp: increasedMP);


  // superHeal 메서드 추가
  void superHeal(Hero hero) {
    if (mp < 50) {
      print('마나가 부족합니다.');
      return;
    }
    hero.hp = Hero.fullHp; // Hero의 HP를 최대치로 설정
    mp -= 50; // 자신의 MP 50 소모
    print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp} mp: ${mp}');
  }
}
