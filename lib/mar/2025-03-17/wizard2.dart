import 'staff.dart';

import 'hero2.dart';

class Magician {
  static const maxHp = 100;
  static const maxMp = 100;
  String _name = '';
  int _hp = maxHp;
  int _mp = maxMp;

  Magician({
    required String name,
    int hp = maxHp,
    int mp = maxMp,
    Staff? staff,
  }) {
    this.name = name;
    this.hp = hp;
    this.mp = mp;
  }

  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('마법사의 이름은 3문자 이상이어야 합니다.');
    }
    _name = value;
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('마법사의 마력은 0 이상이어야 합니다');
    }
    _mp = value;
  }

  int healCount = 0;

  void heal(Hero hero) {
    if (_mp < 10) {
      print('마나가 부족합니다.');
    } else {
      hero.hp += 20;
      _mp -= 10;
      print('힐을 시전했습니다. 대상 HP:${hero.hp}');
    }
  }
}
