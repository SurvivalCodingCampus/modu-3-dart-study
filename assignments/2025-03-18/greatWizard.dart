import 'package:modu_3_dart_study/2025-03-18/wizard.dart';
import 'hero.dart';

class GreatWizard extends Wizard {

  int mp = 150;

  GreatWizard({required String name, required int hp}) : super(name,hp);

  void superHeal(Hero hero) {
    if(mp < 50){
      print('마나가 부족합니다.');
      return;
    }
    mp -= 50;
    hero.hp = hero.maxHP;
    print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}