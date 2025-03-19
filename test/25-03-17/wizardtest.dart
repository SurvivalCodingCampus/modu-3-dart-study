import 'package:test/test.dart';

import '../../assignments/2025-03-17/wizard.dart';

void main() {
  group('Wand test', () {
    test('지팡이 이름 3글자 미만', () {
      expect(() => Wand('a', 10.0), throwsException);
    });
    test('지팡이 마력 0.5미만 100.0 초과', () {
      expect(() => Wand('FairyWand', 0.3), throwsException);
      expect(() => Wand('FairyWand', 105.5), throwsException);
    });
    test('잘 입력된 지팡이', () {
      var wand = Wand('WizardWand', 99.0);
      expect(wand.name, 'WizardWand');
      expect(wand.power, 99.0);
    });
  });
  group('Wizard  test', () {
    test('마법사 이름 3글자 미만', () {
      expect(
        () => Wizard('Ti', 100, 50, wand: Wand('FairyWand', 50.0)),
        throwsException,
      );
    });

    test('마법사의 체력이 음수', () {
      Wand wand = Wand('FairyWand', 50.0);
      Wizard wizard = Wizard('Harry', -200, 50, wand: wand);
      expect(wizard.hp, equals(0));
    });

    test('Wand가 null일때', () {
      Wand wand = Wand('현자의 지팡이', 10.0);
      Wizard wizard = Wizard('Harry', 100, 50);
      expect(() => wizard.wand = null, throwsException);
    });
  });
}
