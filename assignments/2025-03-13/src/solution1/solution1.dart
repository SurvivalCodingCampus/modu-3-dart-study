import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  final int maxHP = 50;
  final int maxMP = 10;

  Cleric (this.name, this.hp, this.mp); // 생성자

  void selfAid() {
    print('셀프 에이드 ! (HP : $hp | MP : $mp)');

    mp -= 5;
    hp = maxHP;

    print('$name의 HP가 회복되었습니다. (HP : $hp | MP : $mp)\n\n');
  }

  int pray(int sec) {
    print('$sec초간 기도합니다. (HP : $hp | MP : $mp)');

    final Random random = Random();
    final int randomNumber = random.nextInt(3); // 0~2
    int prayMP = 0;  //실제 회복량

    if(sec + randomNumber > maxMP - mp) {  //필요량보다 회복량이 많을 때
      prayMP = maxMP - mp;  //실제 회복량은 최대치에서 현재 mp 뺀 값
      mp = maxMP;
    } else {
      prayMP = sec + randomNumber;
      mp = mp + sec + randomNumber;
    }

    print('$name의 MP가 $prayMP만큼 회복되었습니다. (HP : $hp | MP : $mp)\n\n');

    return prayMP;
  }
}