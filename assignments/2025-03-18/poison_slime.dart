import 'hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  static const int minPoisonCount = 0;
  static const int defaultPoisonCount = 5;
  int _poisonCount = PoisonSlime.defaultPoisonCount;

  PoisonSlime(super.suffix);

  int get poisonCount => _poisonCount;

  set poisonCount(int value) {
    if (value < PoisonSlime.minPoisonCount ||
        poisonCount <= PoisonSlime.minPoisonCount) {
      _poisonCount = PoisonSlime.minPoisonCount;
      return;
    }

    _poisonCount = value;
  }

  @override
  void attack(Hero hero) {
    super.attack(hero);
    int poisonDamage = hero.hp ~/ 5;

    if (poisonCount <= PoisonSlime.minPoisonCount) {
      print('독 공격 횟수를 전부 이용했습니다.');
      return;
    }

    hero.hp -= poisonDamage;

    print('추가로, 독 포자를 살포했다!');
    print('$poisonDamage포인트의 데미지');

    poisonCount -= 1;
  }
}
