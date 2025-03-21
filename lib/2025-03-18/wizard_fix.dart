import 'package:modu_3_dart_study/2025-03-17/encapsulation(wand,%20wizard).dart';
import '../2025-03-12/hero.dart';


class Wizard2 extends Wizard {
  Wizard2 ({required super.name, required super.hp})
  : super(mp : 100);

  void heal(Hero hero){
    if(mp < 10) {
      print("마나가 부족합니다.");
    } else {
      hero.hp += 20;
      mp -= 10;
      print("힐을 시전했습니다. HP: ${hero.hp}");
    }
  }
}