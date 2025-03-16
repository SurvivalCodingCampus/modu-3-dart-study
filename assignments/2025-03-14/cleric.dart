import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  static const maxHp = 50;
  static const maxMp = 10;

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

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