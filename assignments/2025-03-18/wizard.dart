import '../2025-03-17/wand.dart';
import 'hero.dart';

class Wizard {
  static const int defaultMp = 100;
  static const int useHealMp = 10;
  static const int healAmount = 20;
  String _name = '';
  int _hp = 0;
  int _mp = Wizard.defaultMp;
  Wand? _wand;

  Wizard({required String name, required int hp, int? mp, Wand? wand}) {
    this.name = name;
    this.hp = hp;
    this.mp = mp ?? Wizard.defaultMp;
    if (wand != null) {
      this.wand = wand;
    }
  }

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  set name(String? value) {
    if (value == null) {
      throw Exception('마법사의 이름을 지정해주세요.');
    }

    if (value.length < 3) {
      throw Exception('마법사의 이름은 3글자 이상이어야합니다.');
    }

    _name = value;
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('마법사의 마력은 0 이상이어야 합니다.');
    }

    _mp = value;
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이를 제대로 설정해주세요.');
    }

    _wand = value;
  }

  void heal(Hero hero) {
    if (mp < Wizard.useHealMp) {
      print('마나가 부족합니다.');
      return;
    }

    hero.hp += Wizard.healAmount;
    mp -= Wizard.useHealMp;

    print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }
}
