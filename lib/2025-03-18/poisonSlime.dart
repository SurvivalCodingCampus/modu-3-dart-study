import '../2025-03-12/hero.dart';

class Slime {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    print("슬라임 $suffix 이/가 공격했다.");
    print('10의 데미지');
    hero.hp -= 10;
  }
}

class PoisonSlime extends Slime {
  int poisonCount = 5;

  PoisonSlime(String suffix)
      : super(suffix);

  //Slime의 attack() method override
  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (poisonCount > 0) {
      print("추가로, 독 포자를 살포했다!");
    }
    hero.hp -= hero.hp ~/ 5.round();
    print("$hero.hp 포인트의 데미지");
  }
  }