// 연습 문제 1
import 'dart:math';

class Cleric {
  final int maxHp = 50;
  final int maxMp = 10;

  String name;
  int hp;
  int mp;

  Cleric(this.hp, this.mp, this.name);

  // 연습 문제 2
  void selfAid() {
    mp -= 5;
    hp = maxHp;
  }

  //연습 문제 3
  int pray(int seconds) {
    int mpPlus = Random().nextInt(3) + seconds;
    if (mp >= maxMp) {
      print('더 이상 mp 를 채울 수 없습니다.');
    } else {
      mp += mpPlus;
      if (mp > maxMp) {
        mp = maxMp;
      }
    }
    return mp;
  }
}
