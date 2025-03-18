import '../2025-03-17/Wand.dart';
import 'hero.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard(this._name, this._hp, {Wand? wand}): _mp = 100 {
    name = _name;
    hp = _hp;
    _wand = wand;
  }

  void heal(Hero hero) {
    if(mp < 10) {
      print("마나가 부족합니다");
      return;
    }
    hero.hp += 20;
    mp -= 10;
    print("힐을 시전했습니다 대상 HP:${hero.hp}");
  }


  String get name => _name;
  set name(String value) {
    if(value.length < 3) {
      throw Exception('마법사의 이름은 3문자 이상이어야 합니다.');
    }
    _name = value;
  }

  int get hp => _hp;
  set hp(int value) {
    _hp = (value < 0) ? 0 : value;
  }

  int get mp => _mp;
  set mp(int value) {
    if(value < 0) {
      throw Exception('마법사의 MP는 0 이상이어야 한다.');
    }
    _mp = value;
  }

  Wand? get wand => _wand;
  set wand(Wand? value) {
    if(value == null) {
      throw Exception('마법사는 생성된 이후에 지팡이를 null로 설정할 수 없습니다.');
    }
    _wand = value;
  }
}