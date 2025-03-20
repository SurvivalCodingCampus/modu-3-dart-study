import 'package:test/test.dart';

import '../../../assignments/2025_03_18/inheritance/solution3/hero.dart';
import '../../../assignments/2025_03_18/inheritance/solution4/wizard.dart';

void main() {
  group('Wizard', () {
    final wizard = Wizard(name: '마법사', hp: 50);
    final hero = Hero(50, '유준');

    test('인스턴스 생성 후 mp 초기값 확인', () {
      expect(wizard.mp, Wizard.maxMp);
    });

    test('마법사의 heal 사용 후 print 문 출력 완료', () {
      // 힐 사용
      wizard.heal(hero);
      // hp 20 증가
      expect(hero.hp, 70);
      // mp 10 감소
      expect(wizard.mp, 90);
    });

    test('mp가 부족할 때', () {
      wizard.mp = wizard.useMp - 1;

      // 마나가 부족합니다 출력 완료
      expect(() => wizard.heal(hero), throwsException);
    });
  });
}
