import 'dart:math';

void main() {
  Cleric cleric = Cleric('힐러1', 50, 50);
  int result = cleric.pray(1);
}

class Cleric {
  final maxHp = 50;
  final maxMp = 50;
  String name;
  int hp;
  int mp;

  Cleric(this.name, this.hp, this.mp);

  var random = Random();

  void selfAid() {
    print('selfAid');
    mp -= -5;
    hp == maxHp;
  }

  int pray(int pray) {
    if (pray == 0) {
      return mp;
    } else if (pray == 1 && mp <= 9) {
      if (mp + random.nextInt(3) > 10) {
        return maxMp;
      } else {
        return mp + random.nextInt(3);
      }
    } else if (pray == 2 && mp < 7) {
      if (mp + random.nextInt(5) > 10) {
        return maxMp;
      } else {
        return mp + random.nextInt(5);
      }
    } else if (pray == 3 && mp < 6) {
      return mp + random.nextInt(3) + 3;
    } else {
      return maxMp;
    }
  }
}
