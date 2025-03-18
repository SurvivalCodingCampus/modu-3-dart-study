import 'package:test/test.dart';

class Wand {
  String name;
  double power;

  Wand({required this.name, required this.power});
}

class Wizard {
  String name;
  int hp;
  Wand? _wand;

  Wizard({required this.name, required this.hp, Wand? wand}) : _wand = wand;

  set wand(Wand value) => _wand = value;

  Wand? grab(Wand wand) {
    _wand = wand;
    print('$name는 ${wand.name}를 들 수 있습니다.');
    return _wand;
  }
}

void main() {
  test('wizard, wand', () {
    // given(준비)
    Wand wand = Wand(name: '지팡이', power: 99.9);
    Wizard wizard = Wizard(name: '마법사', hp: 100);

    // when(실행)
    var wizardWand = wizard.grab(wand);

    // then(검증)
    expect(wizardWand, equals(wand));
  });
}
