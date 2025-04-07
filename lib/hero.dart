import 'dart:math';

// PascalCase
class Cleric {
  String name;
  int hp = 50;
  int mp = 10;
  final int maxHp = 50;
  final int maxMp = 10;

  // 생성자
  Cleric(this.name, this.hp, this.mp);

  // 기능은 모두 함수로 만듬
  // 메서드
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

  @override
  String toString() {
    return 'Cleric{}';
  }


}

void main() {
  final
}