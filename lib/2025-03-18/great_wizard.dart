import 'package:modu_3_dart_study/2025-03-13/claric%202.dart';
import '../2025-03-12/hero.dart';
import '../2025-03-17/encapsulation(wand, wizard).dart';

class GreatWizard extends Wizard {
  GreatWizard({required String name, required int hp, required int mp})
    : super(name: name, hp: hp, mp: 150);

  void superHeal(Hero hero){
    if(mp < 50){
      print("마나가 부족합니다.");
    } else {
      hero.hp = 9999;
      mp -= 50;
      print("슈퍼 힐을 시전했습니다. HP: ${hero.hp}");
    }
  }
}
