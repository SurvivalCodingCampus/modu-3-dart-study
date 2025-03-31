import 'package:modu_3_dart_study/game/slime.dart';

class Sword {
  String name;
  int damage;

  Sword({required this.name, required this.damage});
}

class Hero {
  static int money = 100;
  String name;
  int _hp;
  Sword? sword = null;

  Hero({required this.name,required int hp}) :
      _hp = hp;
  // Hero({required this.name, required this.hp, this.sword});

  int get hp => _hp;

  void bye() {
    print('바이');
  }

  void _die() {
    print('죽었다');
  }

  void attack(Slime slime) {
    print('$name is attacking');
    print('$name이 $slime을 공격했다');
    _hp -= 10;
    if (_hp <= 0) {
      _die();
    }
  }

  void run() {
    print('$name is running away');
  }

  void sit(int sec) {
    print('$name is sitting $sec second');
  }

  void slip() {
    print('$name slipped and fell');
  }

  void sleep() {
    hp = 100;
    print('$name 은 잠을 자고 회복했다.');
  }
}
