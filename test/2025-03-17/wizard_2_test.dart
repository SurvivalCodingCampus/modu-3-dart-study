import 'dart:math';

import 'package:modu_3_dart_study/2025-03-17/wizard_2.dart';
import 'package:test/test.dart';

void main() {
  // 마법사, 지팡이 이름 null && 2글자 미만 x
  // 지팡이의 마력 < 0.5 or 마력 > 100 x
  // 마법사 생성 후 지팡이 null x
  // 마법사 mp < 0 x
  // hp 0 < 0 hp == 0
  // then(검증)

  group('과제', () {
   test('마법사 3글자 미만', () {
     Wizard wizard = Wizard('마법', Wand('지팡이', 5), 5, 1);
     expect(wizard.name.length, lessThan(3));
   });
   test('마법사 3글자 미만 예외 발생', () {
     expect(() => Wizard('마법', Wand('지팡이', 5), 5, 1), throwsException);
   });
    test('지팡이 3글자 미만', () {
      Wand wand = Wand('지팡', 5);
      expect(wand.name.length, lessThan(3));
    });
    test('지팡이 마력 0,5 미만', () {
      Wand wand = Wand('지팡이', 0.4);
      expect(wand.power, lessThan(0.5));
    });
    test('지팡이 마력 100 초과', () {
      Wand wand = Wand('지팡이', 100.1);
      expect(wand.power, greaterThan(100));
    });
    test('마법사 MP<0', () {
      Wizard wizard = Wizard('마법', Wand('지팡이', 0), 5, 0);
      expect(wizard.mp, equals(5));
    });
    test('마법사 hp<0', () {
      Wizard wizard = Wizard('마법', Wand('지팡이', 5), -1, 0);
      expect(wizard.hp, equals(0));
    });
  });
}
