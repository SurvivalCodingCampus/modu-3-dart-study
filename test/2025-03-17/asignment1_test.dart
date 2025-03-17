import 'dart:math';

import 'package:test/test.dart';

import '../../assignments/2025-03-17/asignment1.dart';

void main() {
  test("wizard, wand test", () {
    // 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
    // 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
    // 마법사가 생성된 이후에는 지팡이를 null 로 설정할 수 없다.
    // 마법사의 MP는 0 이상이어야 한다.
    // HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다

    //given
    Wand goodWand = Wand(name: 'goodWand', power: 90.0);
    Wand badWand = Wand(name: 'badWand', power: 0.9);
    // Wand impossibleWand1 = Wand(name: 'hi', power: 0.5);
    // Wand impossibleWand2 = Wand(name: 'hiii', power: 0);

    Wizard wizard1 = Wizard(name: 'wizard1', hp: 10, mp: 10);
    // Wizard wizard2 = Wizard(name: 'wizard2', hp: 10, mp: -1);
    // Wizard wizard3 = Wizard(name: 'w3', hp: 10, mp: 10);
    Wizard wizard4 = Wizard(name: 'wizard4', hp: 100, mp: 100, wand: goodWand);
    Wizard wizard5 = Wizard(name: 'wizard5', hp: 1000, mp: 1000, wand: badWand);

    //when
    // wizard4.wand = null;
    wizard4.hp = -10;

    // wizard4.mp = -10;

    //then
    expect(0, equals(wizard4.hp));
  });
  test('person.age test', () {
    //given
    Person person1 = Person(name: '다트', birthYear: 2000);

    //then
    expect(DateTime.now().year - person1.birthYear, equals(person1.age));
  });
}
