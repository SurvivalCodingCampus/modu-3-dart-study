import 'slime.dart';

class Hero {
  final int maxHp = 100;
  String name;
  int hp;

  Hero(this.hp, this.name);

  void attack(Slime slime) {
    print('$name이 $slime을 공격했다.');
    slime.hp -= 10;
  }

  void run() {
    print('$name이 도망쳤다.');
  }
}
