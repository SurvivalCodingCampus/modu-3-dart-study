// 마법사 클래스
import 'package:modu_3_dart_study/2025-03-14/hero.dart';

import '../2025-03-17/wand.dart';

class Wizard {
  String _name;
  int _hp;
  Wand? _wand;
  int _mp;

  Wizard({required String name, required int hp, int mp = 100, Wand? wand})
    : _name = name,
      _hp = hp,
      _mp = mp,
      _wand = wand {
    if (_name.length < 3) {
      throw Exception("[마법사] 3글자 이상의 이름을 사용해주세요.");
    }
    if (_hp < 0) {
      _hp = 0;
    }

    if (mp < 0) {
      throw Exception("[마법사] MP는 0 이상이어야 합니다.");
    }
    _mp = mp;
  }

  // getter
  String get name => _name; // 이름 읽기
  int get hp => _hp; // HP 읽기
  int get mp => _mp; // MP 일기
  Wand? get wand => _wand; // 지팡이

  // setter
  // 1) 마법사 이름 null 안됨, 3글자 이상
  set name(String name) {
    if (name == null || name.length < 3) {
      throw Exception("[마법사] 3글자 이상의 이름을 사용해주세요.");
    }
    _name = name; // 이름 쓰기 완료
  }

  // 2) hp 음수는 0으로
  set hp(int hp) {
    _hp = hp < 0 ? 0 : hp;
  }

  // 3) mp 0이상
  set mp(int mp) {
    if (mp < 0) {
      throw Exception("[마법사] MP는 0 이상이어야 합니다.");
    }
    _mp = mp;
  }

  // 생성이후 지팡이 null 막기
  set wand(Wand? wand) {
    if (wand == null) {
      throw Exception("[마법사] 이미 지정된 지팡이를 없앨 수 없습니다.");
    }
    _wand = wand;
  }

  void heal(Hero hero) {
    if (_mp < 10) {
      print("마나가 부족합니다");
      return;
    }

    _mp -= 10;
    hero.hp += 20;

    print("힐을 시전했습니다. 대상 HP: ${hero.hp}");
  }
}
