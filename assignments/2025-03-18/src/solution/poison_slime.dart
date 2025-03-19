import 'hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  int poisonCount = 5;
  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (poisonCount > 0) {
      print('추가로 독 포자를 살포했다!');
      int damage = (hero.hp / 5).toInt();
      hero.hp -= damage;
      print('$damage포인트의 데미지');
      poisonCount -= 1;
    }
  }
}

void main() {
  final poisonSlime = PoisonSlime('A');
  final hero = Hero(name: '히어로', hp: 100);

  poisonSlime.attack(hero);
  print(hero.hp);
}
