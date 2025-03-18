import 'dart:math';

import 'package:modu_3_dart_study/2025-03-17/wand.dart';
import 'package:modu_3_dart_study/2025-03-17/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다.',() {
    // 마법사와 지팡이 이름은 nullable 하지 않으므로 null 테스트 생략
    test('지팡이 이름은 3문자 이상이어야 한다.', () {
      expect(() => Wand(name: '지팡', power: 10), throwsException);
    });
    test('마법사 이름은 반드시 3문자 이상이어야 한다.', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      expect(() => Wizard(name: '마법', hp: 10, mp: 10, wand: wand), throwsException);
    });
    test('지팡이 이름은 3문자 이상이어야 한다.', () {
      final Wand wand = Wand(name: '지팡이', power: 10);

      expect(() => wand.name = 'a', throwsException);
    });
    test('마법사 이름은 반드시 3문자 이상이어야 한다.', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      final Wizard wizard = Wizard(name: '마법사', hp: 10, mp: 10, wand: wand);

      expect(() => wizard.name = 'a', throwsException);
    });

    test('이름 생성 성공', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      final Wizard wizard = Wizard(name: '마법사', hp: 10, mp: 10, wand: wand);

      wizard.name = 'aaaaaa';
      wand.name = 'aaaaaa';

      expect(wand, isA<Wand>());
      expect(wizard, isA<Wizard>());
    });
  });

  group('지팡이의 마력은 0.5 이상 100.0 이하여야 한다.', (){
    test('지팡이의 마력은 0.5 이상이여야 한다.', () {
      expect(() => Wand(name: '지팡이', power: 0.1), throwsException);
    });
    test('지팡이의 마력은 100.0 이하여야 한다.', () {
      expect(() => Wand(name: '지팡이', power: 1000), throwsException);
    });
    test('지팡이의 마력은 0.5 이상이여야 한다.', () {
      final Wand wand = Wand(name: '지팡이', power: 10);

      expect(() => wand.power = 0.1, throwsException);
    });
    test('지팡이의 마력은 100.0 이하여야 한다.', () {
      final Wand wand = Wand(name: '지팡이', power: 10);

      expect(() => wand.power = 500, throwsException);
    });
    test('지팡이 생성 성공', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      final Wizard wizard = Wizard(name: '마법사', hp: 10, mp: 10, wand: wand);

      wand.power = 90;

      expect(wand, isA<Wand>());
      expect(wizard, isA<Wizard>());
    });
  });

  group('마법사의 지팡이는 null 일 수 없다.',() {
    test('중간에 null로 바뀔때', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      final Wizard wizard = Wizard(name: '마법사', hp: 10, mp: 10, wand: wand);

      expect(() => wizard.wand = null, throwsException);
    });
    test('생성 시 null 일때', () {
      expect(() => Wizard(name: '마법사', hp: 10, mp: 10), throwsException);
    });
    test('마법사 지팡이 생성 성공', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      final Wizard wizard = Wizard(name: '마법사', hp: 10, mp: 10, wand: wand);

      expect(wand, isA<Wand>());
      expect(wizard, isA<Wizard>());
    });
  });

  group('마법사의 MP는 0 이상이어야 한다.', () {
    test('MP가 음수로 바뀔때', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      final Wizard wizard = Wizard(name: '마법사', hp: 10, mp: 10, wand: wand);

      expect(() => wizard.mp = -1, throwsException);
    });
    test('MP가 음수인 채로 생성될 때', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      expect(() => Wizard(name: '마법사', hp: 10, mp: -1, wand: wand), throwsException);
    });
    test('마법사 MP 테스트 성공', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      final Wizard wizard = Wizard(name: '마법사', hp: 10, mp: 10, wand: wand);

      wizard.mp = 1;

      expect(wand, isA<Wand>());
      expect(wizard, isA<Wizard>());
    });
  });

  group('마법사의 HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다.', () {
    test('HP가 음수인채로 생성될 때', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      final Wizard wizard = Wizard(name: '마법사', hp: -1, mp: 10, wand: wand);

      expect(wand, isA<Wand>());
      expect(wizard, isA<Wizard>());
      expect(wizard.hp, equals(0));
    });
    test('HP가 음수로 바뀌었을 때', () {
      final Wand wand = Wand(name: '지팡이', power: 10);
      final Wizard wizard = Wizard(name: '마법사', hp: -1, mp: 10, wand: wand);

      wizard.hp = -1;

      expect(wand, isA<Wand>());
      expect(wizard, isA<Wizard>());
      expect(wizard.hp, equals(0));
    });
  });
}
