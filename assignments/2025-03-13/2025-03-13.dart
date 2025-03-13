import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  int mp = 10;
  final int maxHp = 50;
  final int maxMp = 10;

  Cleric(this.name, this.hp, this.mp);

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    }
  }

  int pray(int second) {
    int prayMp = second + Random().nextInt(3);
    int realMp;

    if (mp + prayMp > maxMp) {
      realMp = maxMp - mp;
    }
    else {
      realMp = prayMp;
    }
    mp += realMp;
    return realMp;
  }
}