import 'dart:math';

class Cleric {
  final String name;
  int hp = 50;
  int mp = 10;
  final int maxHp = 50;
  final int maxMp = 10;

  Cleric(this.name);

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
      print('$name 은(는) 체력이 회복되었다.');
    } else {
      print('$name 은(는) MP가 부족하여 회복을 할 수 없다.');
    }
  }

  int pray(int sec) {
    if (sec <= 0) {
      print('기도 시간은 1초 이상이어야 합니다.');
      return 0;
    }
    final int recover = sec + Random().nextInt(3);
    final int recoverActual = mp + recover > maxMp ? maxMp - mp : recover;
    mp += recoverActual;
    print('$name 은(는) $sec 초 기도하여 $recoverActual MP가 회복되었다.');
    return recoverActual;
  }
}
