// 마법사 클래스
import 'wand.dart';

class Wizard {
  String _name;
  int _hp;
  Wand? _wand;
  int _mp;

  Wizard({required String name, required int hp, required int mp, Wand? wand})
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
  String get getName => _name; // 이름 읽기
  int get getHp => _hp; // HP 읽기
  int get getMp => _mp; // MP 일기
  Wand? get getWand => _wand; // 지팡이

  // setter
  // 1) 마법사 이름 null 안됨, 3글자 이상
  set setName(String name) {
    if (name == null || name.length < 3) {
      throw Exception("[마법사] 3글자 이상의 이름을 사용해주세요.");
    }
    _name = name; // 이름 쓰기 완료
  }

  // 2) hp 음수는 0으로
  set setHp(int hp) {
    _hp = hp < 0 ? 0 : hp;
  }

  // 3) mp 0이상
  set setMp(int mp) {
    if (mp < 0) {
      throw Exception("[마법사] MP는 0 이상이어야 합니다.");
    }
    _mp = mp;
  }

  // 생성이후 지팡이 null 막기
  set setWand(Wand? wand) {
    if (wand == null) {
      throw Exception("[마법사] 이미 지정된 지팡이를 없앨 수 없습니다.");
    }
    _wand = wand;
  }
}
