import 'dart:math';

class Cleric {
  // 모든 인스턴스가 공유하는 static 필드로 변경
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp;
  int mp;

  // 생성자 오버로딩 구현
  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

  void selfAid() {
    if (hp == maxHp) {
      print("이미 HP는 전부 회복 되었습니다");
      return;
    }
    if (mp < 5) {
      print("MP가 부족하여 selfAid를 사용할 수 없습니다");
      return;
    }
    mp -= 5;
    hp = maxHp;
  }

  int pray(int seconds) {
    final int recovery = seconds + Random().nextInt(3);
    final int actualRecovery = min(recovery, maxMp - mp);
    mp += actualRecovery;
    print('$name이(가) MP를 $actualRecovery 회복했습니다. (현재 MP: $mp)');
    return actualRecovery;
  }
}
