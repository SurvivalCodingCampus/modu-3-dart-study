import '../2025-03-13/hero.dart';
import 'wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp = 100;
  Wand? _wand;   // nullable

  // named parameter
  Wizard(this._name, this._hp, this._mp);

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  void heal(Hero hero) {
    if (_mp < 10) {
      print('마나가 부족합니다');
      return;
    }
    hero.hp += 20;
    mp -= 10;
    print('힐을 시전했습니다. 대상 HP: ${hero.hp}');
  }

  set name(String value) {
    if (value.length < 3) {
      throw Exception('이름이 너무 짧습니다.');
    }

    _name = value; 
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
      throw Exception('HP는 음수가 될 수 없으니 0으로 설정됩니다.');
    }
    _hp = value;
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('마법사는 MP가 항상 0 이상이어야 합니다.');
    }
    _mp = value;
  }

  set wandpower(double value) {
    if (value <= 0.5 || value >= 100.0) {
      throw Exception('마력은 0.5 이상 100.0 이하여야 합니다.');
    }
    _wand!.power = value;
  }

  set wand(Wand? wand) {
    if (_wand != null && wand == null) {
      throw Exception('마법사가 생성된 이후에 지팡이를 null로 설정할 수 없습니다.');
    }
    _wand = wand;

    if (wand != null && wand.name.length < 3) {
      throw Exception('지팡이 이름이 너무 짧습니다.');
    }
  }
}