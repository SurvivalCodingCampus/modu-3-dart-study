import 'dart:math';

class Cleric {
  String name;

  int hp;
  int mp;
  final int maxHp = 50;
  final int maxMp = 10;

  Cleric(this.name, this.hp, this.mp);

  void selfAid() {
    mp -= 5;
    hp = maxHp;
  }

  int pray(int second) {
    final Random random = Random();
    int randomNumber = random.nextInt(3);
    randomNumber += second;
    mp += randomNumber;
    if (mp > maxMp) {
      //"mp는 maxmp를 넘을수없다."
      mp = maxMp;
    }
    return randomNumber;
  }
}
