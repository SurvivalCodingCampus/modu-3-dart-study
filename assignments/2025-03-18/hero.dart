import 'dart:math';

class Hero {
  static const int maxHp = 10000;
  static const String alreadyFellDeadMeg = '이미 쓰러져있습니다.';
  final String name;
  int _hp;

  int get hp => _hp;

  set hp(int value) {
    _hp = value;

    if (_hp < 0) {
      print(alreadyFellDeadMeg);
      _hp = 0;
    }

    _hp = min(maxHp, _hp);
  }

  void receiveHealing(int amount) {
    hp += amount;
  }

  Hero({required this.name, required int hp}) : _hp = hp;
}
