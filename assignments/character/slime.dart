import 'dart:math';

import 'hero.dart';

class Slime {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임$suffix 이 공격했다.');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

class PoisonSlime extends Slime {
  int poisonCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (poisonCount != 0) {
      print('추가로, 독 포자를 살포했다!');
      print('${hero.hp ~/ 5}포인트의 데미지'); //print가 먼저되어야 값이 올바름
      hero.hp -= (hero.hp ~/ 5);
      poisonCount--;
    }
  }
}

void main() {
  Hero hero = Hero('용사', 100);
  PoisonSlime poisonSlime = PoisonSlime('A');
  poisonSlime.attack(hero);
}
