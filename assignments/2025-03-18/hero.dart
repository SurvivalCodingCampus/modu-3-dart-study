import 'dart:math';

class Hero {
  final int maxHP = 100;
  String name;
  int _hp;

  Hero(this.name, this._hp);

  void attack(String slime) {
    print('$name이 $slime을 공격했다.');
    _hp -= 10;
  }

  void run() {
    print('$name이 도망쳤다.');
  }

  int get hp => _hp;
  set hp(int value){
    _hp = max(0, value);
  }
}