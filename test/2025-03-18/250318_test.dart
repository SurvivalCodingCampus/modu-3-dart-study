import 'package:test/test.dart';

import '../../assignments/2025-03-18/core/hero.dart';
import '../../assignments/2025-03-18/solution3/poison_slime.dart';
import '../../assignments/2025-03-18/solution4/wizard.dart';
import '../../assignments/2025-03-18/solution5/great_wizard.dart';

void main() {
  group('250318 - 연습문제3 포이즌 슬라임 테스트 ', () {
    test('독 슬라임 - 공격시 영웅 HP가 maxHp일 때의 동작 테스트', () {
      // 준비
      String currentSuffix = 'x';
      PoisonSlime enemy = PoisonSlime(currentSuffix);
      Hero hero = Hero('주인공', hp: Hero.maxHp);

      print(
        '준비\n'
        '--------------------------------\n'
        '${hero.name}의 현재 HP : ${hero.hp} / ${Hero.maxHp}\n'
        '--------------------------------\n',
      );

      // 올바른 클래스 생성자인 지
      expect(enemy, isA<PoisonSlime>());

      // 초기화가 기본 초기값 제대로 되었는 지
      expect(enemy.poisonCount, equals(PoisonSlime.defaultPoisonCount));

      // 상속 받은 Slime의 suffix가 제대로 설정 되었는 지
      expect(enemy.suffix, equals(currentSuffix));

      // 독 포자 살포
      enemy.attack(hero);

      print(
        '결과\n'
        '--------------------------------\n'
        '${hero.name}의 현재 HP : ${hero.hp} / ${Hero.maxHp}\n'
        '--------------------------------\n',
      );

      // FIXME: 유효성 검사에서 exception이 제대로 발생하는지
    });

    test('독 슬라임 - 공격시 영웅 HP가 1일 때의 동작 테스트', () {
      // 준비
      String currentSuffix = 'x';
      PoisonSlime enemy = PoisonSlime(currentSuffix);
      Hero hero = Hero('주인공', hp: 1);

      print(
        '준비\n'
        '--------------------------------\n'
        '${hero.name}의 현재 HP : ${hero.hp} / ${Hero.maxHp}\n'
        '--------------------------------\n',
      );

      // 올바른 클래스 생성자인 지
      expect(enemy, isA<PoisonSlime>());

      // 초기화가 기본 초기값 제대로 되었는 지
      expect(enemy.poisonCount, equals(PoisonSlime.defaultPoisonCount));

      // 상속 받은 Slime의 suffix가 제대로 설정 되었는 지
      expect(enemy.suffix, equals(currentSuffix));

      // 독 포자 살포
      enemy.attack(hero);

      print(
        '결과\n'
        '--------------------------------\n'
        '${hero.name}의 현재 HP : ${hero.hp} / ${Hero.maxHp}\n'
        '--------------------------------\n',
      );

      // FIXME: 유효성 검사에서 exception이 제대로 발생하는지
    });
  });

  group('250318 - 연습문제4 위자드 ', () {
    test('마법사 스킬 액션', () {
      // 현재의 영웅 남은 Hp 비율 (테스트용)
      final double testValue = 0.5;

      // 비율이 백분율인지
      expect(testValue, inInclusiveRange(0.0, 1.0));

      // 테스트 값을 현재 hp로 적용
      final int defaultHp = (Hero.maxHp * testValue).toInt();
      print('--------테스트 값 : $testValue');

      // 영웅 hp 초기값이 0 ~ maxHp
      expect(defaultHp, inInclusiveRange(0, Hero.maxHp));

      // 준비
      Wizard wiz = Wizard(name: '제이나');
      Hero hero = Hero('주인공', hp: defaultHp);

      // 올바른 클래스 생성자인 지
      expect(wiz, isA<Wizard>());
      expect(hero, isA<Hero>());

      print(
        '준비\n'
        '--------------------------------\n'
        '${hero.name}의 현재 HP : ${hero.hp} / ${Hero.maxHp}\n'
        '${wiz.name}의 현재 MP : ${wiz.mp} / ${Wizard.defaultMaxMp}\n'
        '--------------------------------\n',
      );
      final int currentWizMp = wiz.mp - Wizard.defaultSkillPtHeal;

      // 준비 검증
      expect(hero.hp, equals(defaultHp));

      // 힐 시전 (defaultHealP :
      wiz.heal(hero);

      // 회복 검증 (변화가 있어야 함)
      expect(hero.hp, greaterThan(defaultHp));
      expect(hero.hp, lessThanOrEqualTo(Hero.maxHp));

      // 마나 소모 동작 여부
      expect(wiz.mp == 0 || wiz.mp == currentWizMp, isTrue);

      // FIXME: 유효성 검사에서 exception이 제대로 발생하는지

      print(
        '--------------------------------\n'
        '결과\n'
        '--------------------------------\n'
        '${hero.name}의 현재 HP : ${hero.hp} / ${Hero.maxHp}\n'
        '${wiz.name}의 현재 MP : ${wiz.mp} / ${Wizard.defaultMaxMp}\n'
        '--------------------------------\n',
      );
    });
  });

  group('250318 - 연습문제5 그레이트 위자드 ', () {

    test('그레이트 위자드 스킬 테스트', () {
      // 현재의 영웅 남은 Hp 비율 (테스트용)
      final double testValue = 0.5;

      // 비율이 백분율인지
      expect(testValue, inInclusiveRange(0.0, 1.0));

      // 테스트 값을 현재 hp로 적용
      final int defaultHp = (Hero.maxHp * testValue).toInt();

      print('--------테스트 값 : $testValue');

      // 영웅 hp 초기값이 0 ~ maxHp
      expect(defaultHp, inInclusiveRange(0, Hero.maxHp));

      // 준비
      GreatWizard gWiz = GreatWizard('메디브');
      Hero hero = Hero('주인공', hp: defaultHp);

      final int currentGWizMp = gWiz.mp - GreatWizard.defaultSkillPtSuperHeal;

      print(
        '준비\n'
        '--------------------------------\n'
        '${hero.name}의 현재 HP : ${hero.hp} / ${Hero.maxHp}\n'
        '${gWiz.name}의 현재 MP : ${gWiz.mp} / ${GreatWizard.defaultMaxMp}\n'
        '--------------------------------\n',
      );
      // 올바른 클래스 생성자인 지
      expect(gWiz, isA<GreatWizard>());
      expect(hero, isA<Hero>());

      // 준비 검증
      expect(hero.hp, equals(defaultHp));

      // 수퍼힐 시전
      gWiz.superHeal(hero);

      // 회복 검증 (변화가 있어야 함)
      expect(hero.hp, equals(Hero.maxHp));

      // 소모 마나 검증
      expect(gWiz.mp == 0 || gWiz.mp == currentGWizMp, isTrue);

      // FIXME: 유효성 검사에서 exception이 제대로 발생하는지

      print(
        '--------------------------------\n'
        '결과\n'
        '--------------------------------\n'
        '${hero.name}의 현재 HP : ${hero.hp} / ${Hero.maxHp}\n'
        '${gWiz.name}의 현재 MP : ${gWiz.mp} / ${GreatWizard.defaultMaxMp}\n'
        '--------------------------------\n',
      );
    });
  });
}
