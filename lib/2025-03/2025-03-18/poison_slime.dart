import 'hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  int poisonCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero target) {
    super.attack(target);

    if (poisonCount != 0) {
      int damage = target.hp ~/ 5;
      target.hp -= damage;

      poisonCount -= 1;
    }
  }
}
