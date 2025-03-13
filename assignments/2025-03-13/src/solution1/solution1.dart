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

    print('HP가 회복되었습니다. (HP : $hp | MP : $mp)\n\n');
  }

  void pray(int sec) {
    print('$sec초간 기도합니다. (HP : $hp | MP : $mp)');

    final Random random = Random();
    final int randomNumber = random.nextInt(3); //0~2

    mp = mp + sec + randomNumber;

    if(mp > maxMP) mp = maxMP;  //MP 넘치면 최대MP로 바꿈

    print('MP가 회복되었습니다. (HP : $hp | MP : $mp)\n\n');
  }
}