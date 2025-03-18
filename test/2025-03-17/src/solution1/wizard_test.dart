import 'package:test/test.dart';

import '../../../../assignments/2025-03-17/src/solution1/wizard.dart';

void main() {
  test('Wizard 테스트 - 이름을 null로 설정하는 경우', () {
    // given
    Wizard wizard = Wizard(name: '마법사', hp: 50, mp: 10);

    // then
    expect(() => wizard.name = null, throwsException);
  });

  test('Wizard 테스트 - 이름을 3글자 미만으로 설정하는 경우', () {
    // given
    Wizard wizard = Wizard(name: '마법사', hp: 50, mp: 10);

    // then
    expect(() => wizard.name = '마', throwsException);
  });

  test('Wizard 테스트 - MP를 음수로 설정하는 경우', () {
    // given
    Wizard wizard = Wizard(name: '마법사', hp: 50, mp: 10);

    // then
    expect(() => wizard.mp = -10, throwsException);
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
