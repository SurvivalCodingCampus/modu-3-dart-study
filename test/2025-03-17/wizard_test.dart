import 'package:test/test.dart';

import '../../assignments/2025-03-17/wand.dart';
import '../../assignments/2025-03-17/wizard.dart';

void main() {
  const String wizardName = 'Harry Poter';
  const String wandName = 'Elder wand';
  const int testHp = 50;
  const int testMp = 10;
  const double testPower = 95;

  group('마법사', () {
    test('완벽한 생성', () {
      // given
      Wizard wizard = Wizard(name: wizardName, hp: testHp, mp: testMp);
      wizard.wand = Wand(name: wandName, power: testPower);

      // then
      expect(wizard, isA<Wizard>());
      expect(wizard.name, equals(wizardName));
      expect(wizard.hp, equals(testHp));
      expect(wizard.mp, equals(testMp));
      expect(wizard.wand, isA<Wand>());
      expect(wizard.wand, equals(isNotNull));
      expect(wizard.wand!.name, equals(wandName));
      expect(wizard.wand!.power, inInclusiveRange(0.0, 100.0));
    });

    test('이름 에러', () {
      Wizard wizard = Wizard(name: wizardName, hp: testHp, mp: testMp);

      expect(() => wizard.name = 'we', throwsA(isA<Exception>()));
      expect(() => wizard.name = null, throwsA(isA<Exception>()));
    });

    test('mp 에러', () {
      Wizard wizard = Wizard(name: wizardName, hp: testHp, mp: testMp);

      expect(() => wizard.mp = -1, throwsA(isA<Exception>()));
    });

    test('hp 0 설정', () {
      // given
      Wizard wizard = Wizard(name: wizardName, hp: testHp, mp: testMp);

      // when
      wizard.hp = -10;

      //then
      expect(wizard.hp, equals(0));
    });

    test('지팡이 null 에러', () {
      Wizard wizard = Wizard(name: wizardName, hp: testHp, mp: testMp);

      expect(() => wizard.wand = null, throwsA(isA<Exception>()));
    });
  });

  group('지팡이', () {
    test('완벽한 생성', () {
      // given
      Wand wand = Wand(name: wandName, power: testPower);

      // then
      expect(wand.name, equals(wandName));
      expect(wand.power, inInclusiveRange(0.0, 100.0));
    });

    test('이름 에러', () {
      // given
      Wand wand = Wand(name: wandName, power: testPower);

      expect(() => wand.name = 'we', throwsA(isA<Exception>()));
      expect(() => wand.name = null, throwsA(isA<Exception>()));
    });

    test('Power  에러', () {
      // given
      Wand wand = Wand(name: wandName, power: testPower);

      expect(() => wand.power = -12.0, throwsA(isA<Exception>()));
      expect(() => wand.power = 110.0, throwsA(isA<Exception>()));
    });
  });
}
