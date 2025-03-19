import 'package:modu_3_dart_study/2025-03-17/wand.dart';
import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/poisonSlime.dart';

class Wizard {
  late String _name;
  late int _hp;
  int mp = 100;
  late Wand _wand;
  Hero? _hero;

  String get name => _name;

  int get hp => _hp;

  // int get mp => _mp;

  Wand get wand => _wand;

  Hero? get hero => _hero;

  set wizardNameValidation(String name) {
    if (name.length < 3) {
      print("Wizard의 이름은 최소 3자 이상이여야 합니다");
      throw Exception("Wizard의 이름은 최소 3자 이상이여야 합니다");
    }

    _name = name;
  }

  set wizardHpValidation(int hp) {
    if (hp < 0) {
      print("Wizard의 HP가 0보다 작아서 0으로 설정합니다");
      _hp = 0;
    } else {
      _hp = hp;
    }
  }

  // set wizardMpValidation(int mp) {
  //   if (mp <= 0) {
  //     throw Exception("Wizard의 MP는 0보다 작을 수가 없습니다");
  //   }
  //
  //   _mp = mp;
  // }

  set wizardWandValidation(Wand wand) {
    if (wand == null) {
      throw Exception("Wizard는 Wand를 필수로 가지고 있어야 합니다");
    }

    _wand = wand;
  }

  set wizardHeroValidation(Hero? hero) {
    _hero = hero;
  }

  void heal(Hero hero) {
    if (mp < 20) {
      print("마나가 부족합니다");
      return;
    }

    if (hero.hp + 20 > hero.maxHp) {
      hero.hp = hero.maxHp;
      mp -= 20;
      print("힐을 시전했습니다 대상 HP ${hero.hp}");
      // return;
    }

    hero.hp += 20;
    mp -= 20;
    print("힐을 시전했습니다 대상 HP ${hero.hp}");
  }

  Wizard({
    required String name,
    required int hp,
    required Wand wand,
    int mp = 150,
    Hero? hero,
  }) {
    wizardNameValidation = name;
    // wizardMpValidation = mp;
    wizardHpValidation = hp;
    wizardWandValidation = wand;
    wizardHeroValidation = hero;
  }
}
