import 'package:test/test.dart';

import '../../../assignments/2025_03_18/inheritance/solution3/hero.dart';
import '../../../assignments/2025_03_18/inheritance/solution5/great_wizard.dart';

void main() {
  group('GreatWizard', () {
    final greatWizard = GreatWizard(name: '대마법사', hp: 50);
    final hero = Hero(50, '유준');

    test('인스턴스 생성 후 기본 mp 150 으로 증가', () {
      expect(greatWizard.mp, GreatWizard.gwMaxMp);
    });

    test('superHeal 사용 후 print 문 출력 완료', () {
      // 힐 사용
      greatWizard.superHeal(hero: hero);
      // hero 의 hp 전부 회복
      expect(hero.hp, hero.maxHp);
      // mp 량 50 소모
      expect(greatWizard.mp, 100);
    });

    test('마나가 부족할 때', () {
      greatWizard.mp = 49;

      // 마나가 부족합니다 출력 완료
      expect(() => greatWizard.superHeal(hero: hero), throwsException);
    });
  });
}
