import 'wand.dart';

class Wizard {
  String name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard({required this.name, required int hp, required int mp})
    : _hp = hp < 0 ? hp : 0,
      _mp = mp < 0 ? mp : 0 {
    if (name.length < 3) {
      throw Exception('이름은 반드시 3글자 이상이어야 합니다.');
    }
  }

  int get hp => _hp;
  int get mp => _mp;

  set wand(Wand wand) => _wand = wand;

  set hp(int value) => _hp = value < 0 ? 0 : value;
  set mp(int value) => _mp = value < 0 ? 0 : value;
}
