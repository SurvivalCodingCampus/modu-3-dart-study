import 'package:modu_3_dart_study/2025-03-18/wand.dart';
import 'package:modu_3_dart_study/2025-03-18/hero.dart';

class Wizard {
  static const wizardMaxMP = 100;
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  // 초기화 리스트를 통해 필드를 초기화. setter 호출
  Wizard({required String name, required int hp, int mp = wizardMaxMP, Wand? wand})
    : _name = name,
      _hp = hp,
      _mp = mp,
      _wand = wand;

  void heal(Hero hero) {
    if (_mp < 10) {
      print('마나가 부족합니다');
    } else {
      _mp -= 10;
      hero.hp += 20;
      print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  }

  set wand(Wand? value) {
    // 3번. 마법사의 지팡이는 null일 수 없음.
    if (value == null) {
      throw Exception('에러메세지 : 마법사의 지팡이는 null일 수 없습니다.');
    }
    _wand = value;
  }

  set name(String value) {
    // 1번. 마법사의 이름은 3문자 이상이어야함.
    if (value.length < 3) {
      throw Exception('에러메세지 : 마법사의 이름은 3문자 이상이어야 합니다.');
    }
    _name = value;
  }

  set mp(int value) {
    // 4번. 마법사의 MP는 0 이상이어야함.
    if (value < 0) {
      throw Exception('에러메세지 : 마법사의 MP는 0 이상이어야 합니다.');
    }
    _mp = value;
  }

  set hp(int value) {
    // 5번. 마법사의 HP가 음수가 되면 대신 0으로 설정함.
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }
}
