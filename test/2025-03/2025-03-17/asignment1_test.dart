import 'dart:math';

import 'package:test/test.dart';

import '../../../assignments/2025-03/2025-03-17/asignment1.dart';

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

    // 예외 테스트: 잘못된 이름 길이
    expect(() => Wand(name: 'hi', power: 0.5), throwsException);

    // 예외 테스트: 잘못된 마력 범위
    expect(() => Wand(name: 'hiii', power: 0), throwsException);

    Wizard wizard1 = Wizard(name: 'wizard1', hp: 10, mp: 10);
    Wizard wizard4 = Wizard(name: 'wizard4', hp: 100, mp: 100, wand: goodWand);
    Wizard wizard5 = Wizard(name: 'wizard5', hp: 1000, mp: 1000, wand: badWand);

    // 예외 테스트: 잘못된 MP 값
    expect(() => Wizard(name: 'wizard2', hp: 10, mp: -1), throwsException);

    // 예외 테스트: 잘못된 이름 길이
    expect(() => Wizard(name: 'w3', hp: 10, mp: 10), throwsException);

    //when
    expect(
      () {
        wizard4.wand = null;
      },
      throwsException,
      reason: "지팡이는 null로 설정할 수 없어야 합니다",
    );
    wizard4.hp = -10;

    expect(
      () {
        wizard4.mp = -10;
      },
      throwsException,
      reason: "MP는 음수가 될 수 없어야 합니다",
    );

    //then
    expect(0, equals(wizard4.hp));
    // 추가 검증: 이름 길이 검증
    expect(wizard1.name.length >= 3, isTrue);
    expect(goodWand.name.length >= 3, isTrue);

    // 추가 검증: 지팡이 마력 범위 검증
    expect(goodWand.power >= 0.5 && goodWand.power <= 100.0, isTrue);
    expect(badWand.power >= 0.5 && badWand.power <= 100.0, isTrue);

    // 추가 검증: MP 음수 불가 검증
    wizard1.mp = 5;
    expect(wizard1.mp >= 0, isTrue);

    // 추가 검증: Wand null 불가 검증
    expect(wizard4.wand, isNotNull);
  });
  test('person.age test', () {
    //given
    Person person1 = Person(name: '다트', birthYear: 2000);

    //then
    expect(DateTime.now().year - person1.birthYear, equals(person1.age));
  });
}
