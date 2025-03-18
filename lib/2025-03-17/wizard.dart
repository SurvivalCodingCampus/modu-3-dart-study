import 'package:modu_3_dart_study/2025-03-17/wand.dart';

class Wizard {
  late String _name;
  late int _hp;
  late int _mp;
  late Wand _wand;

  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand get wand => _wand;

  set wizardNameValidation(String name) {
    if (name == null) {
      print("Wizard의 이름은 null일 수 없습니다");
      throw Exception("Wizard의 이름은 null일 수 없습니다");
    }

    if (name.length < 3) {
      print("Wizard의 이름은 최소 3자 이상이여야 합니다");
      throw Exception("Wizard의 이름은 최소 3자 이상이여야 합니다");
    }

    _name = name;
  }

  set wizardHpValidation(int hp) {
    if (hp < 0) {
      print("Wizard의 HP는 0보다 작을 수가 없습니다");
      _hp = 0;
    } else {
      _hp = hp;
    }
  }

  set wizardMpValidation(int mp) {
    if (mp <= 0) {
      print("Wizard의 MP는 0보다 작을 수가 없습니다");
      throw Exception("Wizard의 MP는 0보다 작을 수가 없습니다");
    }

    _mp = mp;
  }

  set wizardWandValidation(Wand wand) {
    if (wand == null) {
      print("Wizard는 Wand를 필수로 가지고 있어야 합니다");
      throw Exception("Wizard는 Wand를 필수로 가지고 있어야 합니다");
    }

    _wand = wand;
  }

  Wizard({
    required String name,
    required int hp,
    required int mp,
    required Wand wand,
  }) {
    wizardNameValidation = name;
    wizardMpValidation = mp;
    wizardHpValidation = hp;
    wizardWandValidation = wand;
  }
}
