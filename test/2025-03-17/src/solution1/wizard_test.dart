import 'package:test/test.dart';

import '../../../../assignments/2025-03-17/src/solution1/wizard.dart';

void main() {
  test('Wizard 테스트 - 이름을 null로 설정하는 경우', () {
    // given
    Wizard wizard = Wizard(name: '마법사', hp: 50, mp: 10);

    // when
    wizard.name = null;

    // then
    expect(wizard.name, equals('마법사'));
  });

  test('Wizard 테스트 - 이름을 3글자 미만으로 설정하는 경우', () {
    // given
    Wizard wizard = Wizard(name: '마법사', hp: 50, mp: 10);

    // when
    wizard.name = '마';

    // then
    expect(wizard.name, equals('마'));
  });

  test('Wizard 테스트 - MP를 음수로 설정하는 경우', () {
    // given
    Wizard wizard = Wizard(name: '마법사', hp: 50, mp: 10);

    // when
    wizard.mp = -10;

    // then
    expect(wizard.mp, equals(-10));
  });

  test('Wizard 테스트 - HP를 음수로 설정하는 경우', () {
    // given
    Wizard wizard = Wizard(name: '마법사', hp: 50, mp: 10);

    // when
    wizard.hp = -10;

    // then
    expect(wizard.hp, equals(0));
  });
}
