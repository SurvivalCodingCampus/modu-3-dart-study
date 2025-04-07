import 'hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  //부모의 생성자의 인수를 생성자에 포함
  PoisonSlime(super.suffix) {
    print("$suffix 라는 이름의 PoisonSlime이 등장하였다!");
  }

  //독 공격 가능 횟수
  int posionCount = 5;

  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (posionCount <= 0) {
      print("독 공격 횟수가 남아 있지 않아 독 공격이 추가로 발생하지 않았습니다");
      return;
    }

    print("추가로, 독 포자를 살포했다!");

    if (hero.hp - (hero.hp / 5).round() <= 0) {
      print("${hero.name}의 HP에 ${hero.hp} 포인트의 데미지!");
      hero.hp = 0;
      throw Exception("Hero는 쓰러졌다");
    }

    hero.hp -= (hero.hp / 5).round(); //용사 hp의 5분의 1의 포인트를 반올림 해서 감소 시킴
    print("${hero.name}의 HP에 ${(hero.hp / 5).round()} 포인트의 데미지!");
    print('Hero ${hero.name}의 HP는 ${hero.hp} 남았다!');
    posionCount -= 1; //독 공격 가능 횟수 1회 감소
  }
}
