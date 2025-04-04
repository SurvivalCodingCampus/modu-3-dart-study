import 'package:modu_3_dart_study/2025-03-17/wizard.dart';
import 'package:modu_3_dart_study/2025-03-18/great_wizard.dart';
import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:test/test.dart';

void main() {
  group('Great Wizard 테스트', () {
    test('Great Wizard는 Wizard 자식클래스이다.', () {
      final greatWizard = GreatWizard('wizard', 100);

      expect(greatWizard, isA<Wizard>());
    });

    test('SuperHeal을 사용하면 hero hp를 전부 회복시키고, 자신의 mp를 50 소모한다.', () {
      final greatWizard = GreatWizard('wizard', 100);
      final hero = Hero(name: 'hero', hp: 100);

      greatWizard.superHeal(hero);

      expect(greatWizard.mp, GreatWizard.maxMp - GreatWizard.superHealCost);
      expect(hero.hp, Hero.maxHp);
    });
  });
}
