import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/slime.dart';

class PoisonSlime extends Slime {
  int _poisonCount;
  
  PoisonSlime(super.suffix): _poisonCount = 5;
  
  @override
  void attack(Hero hero) {
    super.attack(hero);
    if(poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      int point = (hero.hp / 5).toInt();
      hero.hp -= point;
      print('$point포인트의 데미지');
      poisonCount--;
    }
  }

  get poisonCount => _poisonCount;
  set poisonCount(value) {
    _poisonCount = value;
  }
}