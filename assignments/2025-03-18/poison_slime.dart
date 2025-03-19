import 'slime.dart';
import 'hero.dart';

class PoisonSlime extends Slime {
  static const String poisonMsg = '추가로, 독 포자를 살포했다!';
  static const hasNoPoisonMsg = '독이 부족합니다.';

  static String fewDamageMsg(int damage) => '$damage포인트의 데미지';
  int poisonCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (poisonCount > 0) {
      print(poisonMsg);

      final int damage = (hero.hp * 0.2).toInt();
      hero.hp = hero.hp - damage;

      poisonCount -= 1;

      print(fewDamageMsg(damage));
    } else {
      print(hasNoPoisonMsg);
    }
  }
}

main() {}
