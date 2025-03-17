import 'wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  // Wand의 초기값 null 가능 ?
  Wizard(this._name, this._hp, this._mp, {Wand? wand}) {
    name = _name;
    hp = _hp;
    mp = _mp;
    _wand = wand;
  }

  String get name => _name;
  set name(String value) {
    (value.length < 3) ? throw Exception('마법사의 이름은 3문자 이상이어야 합니다.') : _name = value;
  }

  int get hp => _hp;
  set hp(int value) {
    (value < 0) ? _hp = 0 : _hp = value;
  }

  int get mp => _mp;
  set mp(int value) {
    (value < 0) ? throw Exception('마법사의 MP는 0 이상이어야 한다.') : _mp = value;
  }

  Wand? get wand => _wand;
  set wand(Wand? value) {
    (value == null) ? throw Exception('마법사는 생성된 이후에 지팡이를 null로 설정할 수 없습니다.') : _wand = value;
  }
}


void main() {
  Wizard wizard = Wizard('Wdasd', 50, 10, wand: Wand("chldbstjr", 50));
  //wizard.wand = Wand("지팡", 100.0);

  //wizard.wand = Wand("지팡이", 110.0);
  //wizard.wand = Wand("지팡이", 0.0);
  //wizard.wand = Wand("지팡이", 100.0);


  //wizard.mp = -1;
  // wizard.hp = -100;
  // print(wizard.hp);


}