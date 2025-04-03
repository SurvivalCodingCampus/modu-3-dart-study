import 'hero.dart';

class Slime {
  static const maxHp = 50;
  final String suffix;
  int hp = maxHp;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임 $suffix이/가 공격했다.');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

class PoisonSlime extends Slime {
  static const initialPoisonCount = 5; // 처음 포이즌 카운트
  int poisonCount = initialPoisonCount;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (poisonCount < 1) {
      print('슬라임 $suffix의 posionCount가 없어 독공격을 하지 못했다.');
      return;
    }
    print("추가로, 독 포자를 살포했다!");

    final damage = (hero.hp / 5).toInt();
    hero.hp -= damage;
    print("$damage포인트의 데미지");

    poisonCount -= 1;
    if (hero.hp < 0) {
      print("${hero.name}가 사망했다.");
    }
  }
}
