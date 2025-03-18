import 'package:modu_3_dart_study/2025-03-17/wand.dart';

class Wizard {
  String _name = '';
  int _hp = 0;
  int _mp = 0;
  Wand? _wand;

  //생성자
  Wizard({required String name, required int hp, Wand? wand, required int mp}) {
    this.name = name;
    this.hp = hp;
    this.mp = mp;
    if (wand != null) {
      this.wand = wand;
    }
  }

  // name setter, getter 외부에서 _name 읽고 쓸 수 있다.
  set name(String value) {
    if (value.length < 3) {
      throw Exception('이름이 너무 짧습니다.');
    }
    _name = value;
  }

  String get name => _name;

  // wand setter getter 외부에서 _wand 읽고 쓸 수 있다.
  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이를 null로 설정할 수 없습니다.');
    }
    _wand = value;
  }

  Wand? get wand => _wand;

  // hp setter getter 외부에서 _wand 읽고 쓸 수 있다.
  set hp(int value) {
    if (value < 0) {
      _hp = 0;
      throw Exception('HP는 음수값이 설정될 수 없습니다. 0으로 초기화 합니다');
    }
    _hp = value;
  }

  int get hp => _hp;

  // mp setter, getter 외부에서 _mp 읽고 쓸 수 있다.
  set mp(int value) {
    if (value < 0) {
      _mp = 0;
      throw Exception('MP는 0 이상이어야 한다');
    }

    _mp = value;
  }

  int get mp => _mp;

}
