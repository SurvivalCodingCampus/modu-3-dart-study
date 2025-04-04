import 'package:modu_3_dart_study/assignments/2025-03-18/src/solution/great_wizard.dart';
import 'package:modu_3_dart_study/assignments/2025-03-18/src/solution/hero.dart';
import 'package:test/test.dart';

void main() {
  group('Great Wizard - 초기값', () {
    // given
    GreatWizard greatWizard = GreatWizard(name: '마법사', hp: 100);
    test('성공', () {
      // then
      expect(greatWizard.name, equals('마법사'));
      expect(greatWizard.hp, equals(100));
      expect(greatWizard.mp, equals(150));
    });

    test('실패', () {
      // then
      expect(greatWizard.name, equals('마법샤'));
      expect(greatWizard.hp, equals(100));
      expect(greatWizard.mp, equals(100)); // 100은 Super 클래스인 Wizard의 mp 초기값
    });
  });

  group('Wizard 테스트 - superHeal', () {
    // given
    GreatWizard greatWizard = GreatWizard(name: '마법사', hp: 100);
    Hero hero = Hero(name: '홍길동', hp: 50);
    test('성공', () {
      // when
      greatWizard.superHeal(hero: hero);

      // then
      expect(
        greatWizard.mp,
        equals(100),
      ); // superHeal 성공 시 본인의 mp를 50만큼 감소. 초기값 150
      expect(hero.hp, equals(100)); // superHeal 성공 시 unit의 hp를 전부 회복
    });

    test('마나 부족', () {
      greatWizard.mp = 49;

      // when
      greatWizard.superHeal(hero: hero);

      // then
      expect(greatWizard.mp, equals(49)); // 마나 부족 시 superHeal 실패로 mp값 감소 없음
      expect(hero.hp, equals(50)); // hero.hp 값도 변화 없음
    });

    test('실패 - mp값 미차감', () {
      // when
      greatWizard.superHeal(hero: hero);

      // then
      expect(
        greatWizard.mp,
        equals(150),
      ); // superHeal 성공 시 본인의 mp를 50만큼 감소. 초기값 150
      expect(hero.hp, equals(100));
    });

    test('실패 - hero.hp값 미회복', () {
      // when
      greatWizard.superHeal(hero: hero);

      // then
      expect(
        greatWizard.mp,
        equals(100),
      ); // superHeal 성공 시 본인의 mp를 50만큼 감소. 초기값 150
      expect(hero.hp, equals(50)); // superHeal 성공 시 unit의 hp를 전부 회복
    });
  });
}
