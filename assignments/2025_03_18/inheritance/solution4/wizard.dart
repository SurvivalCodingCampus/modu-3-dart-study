import '../solution3/hero.dart';
import 'wand.dart';

class Wizard {
  static const wMaxMp = 100;
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard({required String name, required int hp, int mp = wMaxMp, Wand? wand})
    : _name = name,
      _hp = hp,
      _mp = mp,
      _wand = wand;

  Wand? get wand => _wand;
  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이는 필수입니다.');
    }
    _wand = value;
  }

  set name(String value) {
    if (value.isEmpty) {
      throw Exception('이름을 입력해주세요.');
    }
    if (value.length < 3) {
      throw Exception('3글자 이상 입력해주세요.');
    }
    _name = value;
  }

  set hp(int value) {
    if (value < 0) {
      print('0보다 작을 수 없기 때문에 0으로 변환');
      _hp = 0;
    }
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('0보다 작은수는 입력할 수 없습니다.');
    }
    _mp = value;
  }

  void heal({required Hero hero}) {
    if (mp < 10) {
      print('마나가 부족합니다.');
    }
    mp -= 10;
    hero.hp += 20;

    print('힐을 시전했습니다. ${hero.name} HP : ${hero.hp}');
  }
}
