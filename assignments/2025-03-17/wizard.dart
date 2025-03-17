import 'wand.dart';

class Wizard {
  String _name = '';
  int _hp = 0;
  int _mp = 0;
  Wand? _wand;

  Wizard({required String name, required int hp, required int mp, Wand? wand}) {
    this.name = name;
    this.hp = hp;
    this.mp = mp;
  }

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  set name(String? value) {
    if (value == null) {
      throw Exception('마법사의 이름을 지정해주세요.');
    }

    if (value.length < 3) {
      throw Exception('마법사의 이름은 3글자 이상이어야합니다.');
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
      throw Exception('마법사의 마력은 0 이상이어야 합니다.');
    }

    _mp = value;
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이를 제대로 설정해주세요.');
    }

    _wand = value;
  }
}
