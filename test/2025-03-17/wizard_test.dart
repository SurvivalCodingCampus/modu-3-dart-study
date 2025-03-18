import 'package:modu_3_dart_study/2025-03-17/Wand.dart';
import 'package:modu_3_dart_study/2025-03-17/Wizard.dart';
import 'package:test/test.dart';

void main() {
  group('마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다', () {
    test('마법사 이름은 반드시 3문자 이상이어야 한다', () {
      expect(() => Wizard("윤", 50, 10, wand: null), throwsException);
    });

    test('지팡이의 이름은 반드시 3문자 이상이어야 한다', () {
      expect(() => Wand("지", 100.0), throwsException);
    });
  });

  group('지팡이의 마력은 0.5 이상 100.0 이하여야 한다.', () {
    test('지팡이의 마력이 0.5 미만이면 예외 발생', () {
      expect(() => Wand("지팡이", 0.49), throwsException);
    });

    test('지팡이의 마력이 100.0 초과하면 예외 발생', () {
      expect(() => Wand("지팡이", 100.1), throwsException);
    });
  });

  group('마법사가 생성된 이후에는 지팡이를 null로 설정할 수 없다.', () {
    test('마법사의 wand를 null로 설정하면 예외 발생', () {
      final wizard = Wizard("마법사", 50, 10, wand: null);
      expect(() => wizard.wand = null, throwsException);
    });
  });

  group('마법사의 MP는 0 이상이어야 한다. ', () {
    test('마법사의 MP는 0 이상이어야 한다. ', () {
      final wizard = Wizard("마법사", 50, 10, wand: null);
      expect(() => wizard.mp = -100, throwsException);
    });
  });

  group('HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다', () {
    test('HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다', () {
      final wizard = Wizard("마법사", 50, 10, wand: null);
      wizard.hp = -100;
      expect(wizard.hp, equals(0));
    });
  });
}