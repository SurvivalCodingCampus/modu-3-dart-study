// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard({required String name, required int hp, required int mp, Wand? wand})
    : _name = name,
      _hp = hp,
      _mp = mp,
      _wand = wand;

  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand? get wand => _wand;

  set name(String? text) {
    if (text == null) {
      throw Exception("이름은 Null일 수 없습니다");
    } else if (text.length < 3) {
      throw Exception("이름은 반드시 3글자 이상이어야 합니다");
    }
    _name = text;
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
      print('hp는 음수가 불가능하여 0으로 설정합니다');
    } else {
      _hp = value;
    }
  }

  set mp(int value) {
    value < 0 ? throw Exception("마법사의 mp는 0 이상이어야 합니다") : _mp = value;
  }

  set wand(Wand? value) {
    value == null
        ? throw Exception('지팡이가 생성된 이후에는 Null로 지정할 수 없습니다')
        : _wand = value;
  }
}
