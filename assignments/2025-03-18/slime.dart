import 'hero.dart';

class Slime {
  final String suffix;

  //슬라임 이름
  Slime(this.suffix);

  void attack(Hero hero) {
    print('$suffix이/가 10의 기본 공격을 가했다.');
    if (hero.hp > 10) {
      hero.hp -= 10;
    } else
      hero.hp = 0;
  }
}
