import 'package:modu_3_dart_study/PR2025-03-18/hero.dart';

class Wizard {
  String _name = '';
  int _hp = 0;
  int _mp = 100;
  int initialMp = 100;

  set name(String value) {
    if (value.length < 3) {
      throw Exception("이름이 너무 짧습니다.");
    }
    _name = value;
  }

  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
      throw Exception('hp는 음수가 불가능하여 0으로 설정합니다');
    } else {
      _hp = value;
    }
  }

  //setter로 mp 유효성 추가
  set mp(int value) {
    if (value < 0) {
      _mp = 0;
      throw Exception("MP는 음수일 수 없습니다.");
    }
    _mp = value;
  }

  void heal(Hero hero) {
    if (mp >= 10) {
      mp -= 10;
      hero.hp += 20;
      print('힐을 시전했습니다. ${hero.name}의 HP : ${hero.hp}');
    } else
      print('마나가 부족합니다');
  }

  Wizard({required String name, required int hp, int? mp}) {
    this.name = name;
    this.hp = hp;
    if (mp == null) {
      this.mp = initialMp;
    }
  }
}
