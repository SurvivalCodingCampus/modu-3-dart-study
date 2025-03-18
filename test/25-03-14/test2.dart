import 'package:test/test.dart';

import '../../assignments/2025-03-14/cleric.dart';

void main() {
  group('Cleric Tests', () {
    test('기본 생성자 초기화 확인', () {
      final cleric = Cleric('성기사');
      expect(cleric.name, '성기사');
      expect(cleric.hp, Cleric.maxHp);
      expect(cleric.mp, Cleric.maxMp);
    });

    test('HP와 MP 설정', () {
      final cleric = Cleric('성기사', hp: 30, mp: 7);
      expect(cleric.hp, 30);
      expect(cleric.mp, 7);
    });

    test('HP와 MP가 최댓값 초과할 경우 maxHp와 maxMp로 설정', () {
      final cleric = Cleric('성기사', hp: 150, mp: 100);
      expect(cleric.hp, Cleric.maxHp);
      expect(cleric.mp, Cleric.maxMp);
    });
  });
}