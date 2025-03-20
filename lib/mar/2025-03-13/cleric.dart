import 'dart:math';

class Cleric {
  String name;
  // int hp;
  // int mp;

  final int max_hp = 50;
  final int max_mp = 10;

  // Cleric(this.name, this.hp, this.mp);

  int hp = 50;
  int mp = 10;
  Cleric(this.name);

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = max_hp;
    } else {
      print('mp가 부족합니다');
    }
  }

  int pray(int seconds) {
    int mpRecovery = Random().nextInt(3) + seconds; // 회복할 mp
    int recoveryMp = mp + mpRecovery;  // 회복된 후 mp
    int actualRecovery = mpRecovery;  //실제 회복량

    if (recoveryMp > max_mp) {
      actualRecovery = max_mp - mp;
      mp = max_mp;
    } else {
      mp = recoveryMp;
    }
    return actualRecovery;
  }
}


