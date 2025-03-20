import 'dart:math';

class Cleric {
  final String name;
  int hp;
  int mp;

  static const int maxHp = 50;
  static const int maxMp = 10;


  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});


  void selfAid() {
    if (mp < 5) {
      return;
    }
    mp -= 5;
    hp = maxHp;
  }

  int pray(int seconds) {
    // 회복할 mp
    int mpRecovery = Random().nextInt(3) + seconds;
    // 회복할 mp
    int recoveryMp = mp + mpRecovery;
    //실제 회복량
    int actualRecovery = mpRecovery;

    if (recoveryMp > maxHp) {
      actualRecovery = maxHp - mp;
      mp = maxHp;
    } else {
      mp = recoveryMp;
    }
    return actualRecovery;
  }
}


