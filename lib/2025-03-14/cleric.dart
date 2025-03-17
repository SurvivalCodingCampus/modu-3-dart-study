import 'dart:math';

class Cleric {
  static const int maxHP = 50;
  static const int maxMP = 10;

  final String name;
  int hp;
  int mp;

  Cleric(this.name, {this.hp = maxHP, this.mp = maxMP});

  // HP 최대 회복, MP 5 감소
  void selfAid() {
    print('셀프 에이드 ! (HP : $hp | MP : $mp)');

    if(mp < 5) {
      print('MP가 부족합니다.');
      return;
    }
    mp -= 5;
    hp = maxHP;

    print('$name의 HP가 회복되었습니다. (HP : $hp | MP : $mp)\n\n');
  }

  // MP 기도시간 + 0~2 만큼 회복
  int pray(int sec) {
    print('$sec초간 기도합니다. (HP : $hp | MP : $mp)');

    final Random random = Random();
    final int randomNumber = random.nextInt(3); // 0~2
    int prayMP = 0;  //실제 회복량

    //필요량보다 회복량이 많을 때
    if(sec + randomNumber > maxMP - mp) {
      prayMP = maxMP - mp;  //실제 회복량은 최대치에서 현재 mp 뺀 값
      mp = maxMP;
    } else {
      prayMP = sec + randomNumber;  // 실제 회복량은 sec + randomNumber와 동일
      mp = mp + sec + randomNumber;
    }

    print('$name의 MP가 $prayMP만큼 회복되었습니다. (HP : $hp | MP : $mp)\n\n');

    return prayMP;
  }
}