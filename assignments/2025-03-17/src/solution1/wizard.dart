import 'wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  static const int maxHp = 50;
  static const int maxMp = 10;
  Wand? _wand;

  // 생성자
  Wizard({required String name, int hp = maxHp, int mp = maxMp, Wand? wand})
      : _name = name,
        _hp = hp,
        _mp = mp,
        _wand = wand {
    _validateName(name);
    _validateHp(hp);
    _validateMp(mp);
  }

  //------- Name setter & getter
  String get name => _name;

  set name(String value) {
    _validateName(value);
    _name = value;
  }

  //------- Hp setter & getter
  int get hp => _hp;

  set hp(int value) {
    if (value < 0) {
      _hp = 0;  // 음수일 경우 0으로 설정
    } else {
      _validateHp(value);
      _hp = value;
    }
  }

  //------- Mp setter & getter
  int get mp => _mp;

  set mp(int value) {
    _validateMp(value);
    _mp = value;
  }

  //------- Wand setter & getter
  Wand? get wand => _wand;

  set wand(Wand? value) {
    if (_wand != null && value == null) {
      throw Exception('마법사는 지팡이를 null로 설정할 수 없습니다');
    }
    _wand = value;
  }

  // 예외 처리 함수
  void _validateName(String name) {
    if (name.length < 3) {
      throw Exception('마법사 이름은 3자 이상이어야 합니다.');
    }
  }

  void _validateHp(int hp) {
    if (hp < 0) {
      throw Exception('HP는 0 이상이어야 합니다.');
    } else if (hp > maxHp) {
      throw Exception('HP는 최대 $maxHp를 초과할 수 없습니다.');
    }
  }

  void _validateMp(int mp) {
    if (mp < 0) {
      throw Exception('MP는 0 이상이어야 합니다.');
    } else if (mp > maxMp) {
      throw Exception('MP는 최대 $maxMp를 초과할 수 없습니다.');
    }
  }
}