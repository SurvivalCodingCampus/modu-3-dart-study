import 'hero.dart';

class Slime {
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    if (hero.hp <= 0) {
      hero.hp = 0;
      throw Exception("Hero는 쓰러졌다");
    }

    if (hero.hp - 10 <= 0) {
      print("${hero.name}의 HP에 ${hero.hp} 포인트의 데미지!");
      hero.hp = 0;
      print('Hero ${hero.name}의 HP는 ${hero.hp} 남았다!');
      throw Exception("Hero는 쓰러졌다");
    }

    hero.hp -= 10;

    print('$suffix 이/가 공격했다');
    print('10의 데미지');
    print("${hero.name}의 HP에 10 포인트의 데미지!");
    print('Hero ${hero.name}의 HP는 ${hero.hp} 남았다!');
  }
}
