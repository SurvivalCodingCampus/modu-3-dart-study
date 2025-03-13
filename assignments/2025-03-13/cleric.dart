import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;
  final String name;

  int hp;
  int mp;

  Cleric(this.name, this.hp, this.mp) {
    hp = (hp > maxHp) ? maxHp : hp;
    mp = (mp > maxMp) ? maxMp : mp;
  }

  void selfAid() {
    mp -= 5;
    hp = maxHp;
  }

  int pray(int second) {
    final int recoveryAmount = second + Random().nextInt(3);
    final int sum = mp + recoveryAmount;

    mp = (sum > maxMp) ? maxMp : sum;

    return recoveryAmount;
  }
}
