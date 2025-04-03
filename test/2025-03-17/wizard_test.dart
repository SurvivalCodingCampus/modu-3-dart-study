import 'dart:core';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-17/wand.dart';
import 'package:modu_3_dart_study/2025-03-17/wizard.dart'; // Exception을 사용하기 위해 필요

void main() {
  group('Wizard Class Tests', () {
    // 이름이 너무 짧을 때 예외가 발생하는지 테스트
    test('Wizard name too short throws exception', () {
      try {
        final wizard = Wizard('둘', 100, 50); // 이름이 3자 미만일 때 예외 발생
      } catch (e) {
        expect(e.toString(), contains('이름이 너무 짧습니다.'));
      }
    });

    // HP가 음수일 때 예외가 발생하고 HP가 0으로 설정되는지 테스트
    test('HP cannot be negative, set to 0', () {
      final wizard = Wizard('둘리', 100, 50);
      try {
        wizard.hp = -10; // HP가 음수일 때 예외 발생
      } catch (e) {
        expect(e.toString(), contains('HP는 음수가 될 수 없으니 0으로 설정됩니다.'));
        expect(wizard.hp, 0); // HP가 0으로 설정되었는지 확인
      }
    });

    // MP가 음수일 때 예외가 발생하는지 테스트
    test('MP cannot be negative', () {
      final wizard = Wizard('둘리', 100, 50);
      try {
        wizard.mp = -5; // MP가 음수일 때 예외 발생
      } catch (e) {
        expect(e.toString(), contains('마법사는 MP가 항상 0 이상이어야 합니다.'));
      }
    });

    // wandpower가 유효하지 않을 때 예외가 발생하는지 테스트
    test('Wand power out of bounds', () {
      final wizard = Wizard('둘리', 100, 50);
      try {
        wizard.wand = Wand(name: '지팡이', power: .3); // 마력 값이 범위를 벗어날 때 예외 발생
      } catch (e) {
        expect(e.toString(), contains('마력은 0.5 이상 100.0 이하여야 합니다.'));
      }
    });

    // 지팡이가 생성된 후 null로 설정할 수 없음을 테스트
    test('Wand cannot be set to null after creation', () {
      final wand = Wand(name: '지팡이', power: 50);
      final wizard = Wizard('둘리', 100, 50);
      wizard.wand = wand;
      
      try {
        wizard.wand = null; // 지팡이를 null로 설정할 때 예외 발생
      } catch (e) {
        expect(e.toString(), contains('마법사가 생성된 이후에 지팡이를 null로 설정할 수 없습니다.'));
      }
    });

    // 지팡이 이름이 너무 짧을 때 예외가 발생하는지 테스트
    test('Wand name too short throws exception', () {
      final wizard = Wizard('둘리', 100, 50);
      try {
        final wand = Wand(name: '짧', power: 50); // 이름이 3자 미만일 때 예외 발생
        wizard.wand = wand;
      } catch (e) {
        expect(e.toString(), contains('지팡이 이름이 너무 짧습니다.'));
      }
    });
  });
}