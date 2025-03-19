import 'package:modu_3_dart_study/2025-03-18/slime.dart';
import 'package:modu_3_dart_study/2025-03-18/hero.dart';

class PoisonSlime extends Slime {
  int poisonCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack({required Hero hero}) {
    // 우선, 보통 슬라임과 같은 공격
    super.attack(hero: hero);

    // 추가적으로 독 공격으로 hp 1/5 만큼의 데미지를 줌
    if (poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');

      int damage = hero.hp ~/ 5;

      print('$damage포인트의 데미지');
      hero.hp -= damage;
      poisonCount -= 1;
    }
  }
}
