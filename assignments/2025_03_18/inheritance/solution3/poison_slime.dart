import 'hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  int poisonCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack({required Hero hero}) {
    int poisonAttack = (hero.hp / 5).round();

    super.attack(hero: hero);

    if (poisonCount > 0) {
      print('$suffix이/가 추가로 독 포자를 살포했다!');
      hero.hp -= poisonAttack;
      print('$poisonAttack포인트의 데미지');

      poisonCount--;
    }
  }
}
