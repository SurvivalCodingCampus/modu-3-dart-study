import 'dart:math';

class Cleric {
  String name;
  final int maxHp = 50;
  final int maxMp = 10;
  int hp = 50;
  int mp = 10;

  Cleric(this.name);

  void selfAid() {
    if (mp >= 5) {
      hp = maxHp;
      mp -= 5;
    }
  }

  int pray(int second) {
    final int randomPoint = Random().nextInt(3);
    final healMp = randomPoint + second;
    final healedMp = mp + healMp > maxMp ? maxMp - mp : healMp;
    mp = mp + healedMp;
    return healedMp;
  }
}

main() {

}