import 'package:modu_3_dart_study/2025-03-18/hero.dart';

class Slime {
  final String suffix;
  int hp = 50;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임 $suffix 이/가 공격했다.');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

class PoisonSlime extends Slime {
  PoisonSlime({required String suffix}) : super(suffix);

  int _poisonCount = 5;

  int get poisonCount => _poisonCount;

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (_poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      int doubleHp = (hero.hp * 0.2).toInt();
      hero.hp = hero.hp - doubleHp;
      print('$doubleHp포인트의 데미지');
      _poisonCount -= 1;
    }
  }
}

void main() {
  Hero hero = Hero(100);
  PoisonSlime poisonSlime = PoisonSlime(suffix: 'A');
  poisonSlime.attack(hero);
}
