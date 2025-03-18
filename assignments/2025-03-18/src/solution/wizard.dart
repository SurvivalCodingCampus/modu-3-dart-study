import '../../../2025-03-17/src/solution1/wand.dart';
import 'hero.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp = 100;
  Wand? _wand;

  Wizard({required String name, required int hp, Wand? wand})
    : _name = name,
      _hp = hp,
      _wand = wand;
  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand? get wand => _wand;

  set name(String text) {
    if (text.length < 3) {
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
    if (value < 0) {
      // 선생님 피드백 반영하여 삼항 연산자 제거
      throw Exception("마법사의 mp는 0 이상이어야 합니다");
    }

    _mp = value;
  }

  set wand(Wand? value) {
    if (value == null) {
      // 선생님 피드백 반영하여 삼항 연산자 제거
      throw Exception('지팡이가 생성된 이후에는 Null로 지정할 수 없습니다');
    }

    _wand = value;
  }

  void heal({required Hero hero}) {
    if (mp < 10) {
      // mp가 10보다 작은 경우 힐 불가능
      print('마나가 부족합니다...');
    } else {
      hero.hp += 20; // Unit(hero)의 hp를 20만틈 회복
      _mp -= 10; // 본인의 mp를 10만큼 소모
      print('힐을 시전했습니다. 대상 HP:${hero.hp}');
    }
  }
}
