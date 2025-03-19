import 'dart:math';
import 'package:test/test.dart';
import '../../assignments/2025-03-18/great_wizard.dart';
import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/posion_Slime.dart';
import '../../assignments/2025-03-18/wizard.dart';

void main() {
  group('PoisonSlime', ()
  {
    test('1. PoisonSlime 공격시 hero hp가 fullHP일때', () {

      // given(준비)
      String testSuffix = 'A';
      PoisonSlime poisonSlime = PoisonSlime(testSuffix);
      Hero hero = Hero(name:'문성용', hp: Hero.fullHp);

      // when(실행)

      // then(검증)
      // 생성자 동작 확인
      expect(poisonSlime, isA<PoisonSlime>());
      //초기화 poisonCount 값 테스트
      expect(poisonSlime.poisonCount, equals(PoisonSlime.defaultPoisonCount));
      //상속 상태 확인
      expect(poisonSlime.suffix, equals(testSuffix));
      //attack 테스트
      poisonSlime.attack(hero);

    });
  });

  group('Wizard', () {
    test('1. Wizard의 Heal 테스트', () {

      // given(준비)
      Hero injuredHero = Hero(name: '홍길동', hp: 100);
      Wizard wizard = Wizard(name: '산신령', hp: 100 ,mp: 100);

      // when(실행)
      wizard.heal(injuredHero);
      wizard.heal(injuredHero);
      wizard.heal(injuredHero);

      // then(검증)

    });
  });

  group('GreatWizard', () {
    test('1. GreatWizard의 SuperHeal 테스트', () {

      final double testValue = 0.5;

      // given(준비)
      Hero woundedHero  = Hero(name: '홍길동', hp: 100);
      GreatWizard greatWizard = GreatWizard(name: '크레이트산신령', hp: 100);

      // when(실행)
      greatWizard.superHeal(woundedHero );
      greatWizard.superHeal(woundedHero );
      greatWizard.superHeal(woundedHero );

      // then(검증)

    });
  });









}