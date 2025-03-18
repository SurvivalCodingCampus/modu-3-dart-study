import 'wand.dart';

class Wizard {
  static const minimumHp = 0;
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard(this._name, this._hp, this._mp, this._wand) {
    _nameValidator();
    _mpValidator();
    _hpCheck();
  }

  // ----- name -----
  String get name => _name;
  set name(String value) {
    _name = value;
    _nameValidator();
  }

  // ----- wand -----
  Wand? get wand {
    wandValidator();
    return _wand;
  }

  set wand(Wand? value) {
    _wand = value;
    wandValidator();
  }

  // ----- mp -----
  set mp(int value) {
    _mp = value;
    _mpValidator();
  }

  int get mp => _mp;

  // ----- hp -----
  set hp(int value) {
    _hp = value;
    _hpCheck();
  }

  int get hp => _hp;

  // ----- validator -----

  // 이름 유효성 검사
  void _nameValidator() {
    if (_name.length < 3) {
      throw Exception("지팡이의 이름은 3글자 이상이여야합니다.");
    }
  }

  // mp 유효성 검사
  void _mpValidator() {
    if (_mp < 0) {
      throw Exception("$_name의 mp가 없습니다.");
    }
  }

  // hp 유효성 검사
  void _hpCheck() {
    if (_hp < minimumHp) {
      _hp = minimumHp;
    }
  }

  // wand null 검사
  void wandValidator() {
    if (_wand == null) {
      throw Exception("$_name의 완드가 없습니다.");
    }
  }
}
