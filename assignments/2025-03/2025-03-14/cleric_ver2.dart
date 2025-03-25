import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  static const int maxHp = 50;
  static const int maxMp = 10;

  Cleric(this.name, {this.hp = Cleric.maxHp, this.mp = Cleric.maxMp});

  void selfAid() {
    if (mp < 5) {
      return print("MP가 부족합니다.");
    }
    mp -= 5;
    hp = maxHp;
    print("남은 MP : $mp");
    print("hp가 모두 회복되었습니다.");
  }

  int pray(int sec) {
    if (sec < 1) {
      print("1초 이상 기도해주세요");
      return 0;
    }
    int randomBonus = Random().nextInt(3);
    int amountOfRecoverMp = sec + randomBonus;
    if (mp + amountOfRecoverMp > maxMp) {
      amountOfRecoverMp = maxMp - mp;
      mp = maxMp;
    } else {
      mp += amountOfRecoverMp;
    }

    return amountOfRecoverMp;
  }
}
