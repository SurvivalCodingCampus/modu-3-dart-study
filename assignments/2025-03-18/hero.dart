import 'slime.dart';

class Hero {
  static const int minHp = 0;
  static const int maxHp = 100;
  final String _name;
  int _hp;

  Hero({required String name, required int hp}) : _name = name, _hp = hp;

  int get hp => _hp;
  set hp(int value) {
    if (value < Hero.minHp) {
      _hp = Hero.minHp;
      return;
    }

    if (value > Hero.maxHp) {
      _hp = Hero.maxHp;
      return;
    }
    _hp = value;
  }

  String get name => _name;

  void attack(Slime slime) {
    print('$name이 $slime을 공격했다');
  }

  void run() {
    print('$name이 도망쳤다.');
  }
}
