import 'hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  int poisonCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      int heroDamage = (hero.hp / 5).toInt();
      hero.hp -= heroDamage;
      print("$heroDamage 포인트의 데미지");
      poisonCount--;
    }
  }
}