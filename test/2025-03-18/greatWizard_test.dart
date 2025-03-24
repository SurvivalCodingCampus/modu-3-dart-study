
import 'package:modu_3_dart_study/2025-03-17/wand.dart';
import 'package:modu_3_dart_study/2025-03-18/poisonSlime.dart';
import 'package:modu_3_dart_study/2025-03-18/slime.dart';
import 'package:modu_3_dart_study/2025-03-18/wizard.dart';
import 'package:modu_3_dart_study/2025-03-18/greatWizard.dart';
import 'package:modu_3_dart_study/2025-03-18/hero.dart';
import 'package:test/test.dart';

void main() {
  group("GreatWizard 클래스 테스트", () {
    Wand wand1 = Wand(name: "지팡이1", power: 20);
    Wand wand2 = Wand(name: "지팡이2", power: 10);

    Hero hero = Hero(name: "아제스", hp: 100);

    GreatWizard greatWizard = GreatWizard(
      hp: 100,
      name: "대마법사",
      wand: wand1,
      mp: 150,
    );

    Wizard wizard = Wizard(name: "마도사", hp: 90, wand: wand2);

    PoisonSlime poisonSlime = PoisonSlime("포이즌 슬라임");
    Slime slime = Slime("슬라임");

    test("초기 상태 테스트", () {
      expect(greatWizard, isNotNull); //객체가 생성이 되었나
      expect(greatWizard.mp, greaterThanOrEqualTo(wizard.mp)); //mp가 Wizard보다 큰가
    });

    test("superHeal() 메서드 테스트", () {
      const limitMp = 50;

      // mp가 50인 상태로 설정
      greatWizard.mp = limitMp;

      //"슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}" 출력이 발생했는지 확인
      greatWizard.superHeal(hero);

      //hero.hp가 최대 HP로 회복되었는지 확인
      expect(hero.hp, equals(hero.maxHp));

      //mp가 50 감소했는지 확인
      expect(greatWizard.mp, equals(limitMp - 50));
    });
  });

  group("Wizard 클래스 테스트", () {
    test("초기 상태 테스트", () {
      Wand wand1 = Wand(name: "지팡이1", power: 20);
      Wand wand2 = Wand(name: "지팡이2", power: 10);

      Hero hero = Hero(name: "아제스", hp: 100);

      GreatWizard greatWizard = GreatWizard(
        hp: 100,
        name: "대마법사",
        wand: wand1,
        mp: 150,
      );

      Wizard wizard = Wizard(name: "마도사", hp: 90, wand: wand2);

      PoisonSlime poisonSlime = PoisonSlime("포이즌 슬라임");
      Slime slime = Slime("슬라임");

      //Wizard 객체를 생성한다.
      expect(wizard, isNotNull);
      //mp가 100으로 설정되었는지 확인한다.
      expect(wizard.mp, equals(100));
    });

    test("heal() 메서드 테스트(MP가 충분한 경우)", () {
      Wand wand2 = Wand(name: "지팡이2", power: 10);
      Hero hero = Hero(name: "아제스", hp: 100);
      Wizard wizard = Wizard(name: "마도사", hp: 90, wand: wand2);

      wizard.mp = 100;
      hero.hp = 100;

      // 히어로의 이전 HP 검증
      expect(hero.hp, equals(100));

      wizard.heal(hero);

      // 히어로의 힐 실행 이후 HP 검증
      expect(hero.hp, equals(120));

      // 위자드의 mp 감소 검증
      expect(wizard.mp, equals(80));
    });

    test("heal() 메서드 테스트(MP가 부족한 경우)", () {
      Wand wand1 = Wand(name: "지팡이1", power: 20);
      Wand wand2 = Wand(name: "지팡이2", power: 10);

      Hero hero = Hero(name: "아제스", hp: 100);

      Wizard wizard = Wizard(name: "마도사", hp: 90, wand: wand2);

      //mp를 10 미만으로 설정
      wizard.mp = 9;

      wizard.heal(hero);

      // 위자드의 힐 실행 이후 HP 검증
      expect(hero.hp, equals(100));

      // 위자드의 mp 감소 검증
      expect(wizard.mp, equals(9));
    });
  });

  group("PoisonSlime 클래스 테스트", () {
    test("초기 상태 테스트", () {
      PoisonSlime poisonSlime = PoisonSlime("포이즌 슬라임");

      //객체가 생성이 되었나
      expect(poisonSlime, isNotNull);

      //poisonCount가 5로 설정되었는지
      expect(poisonSlime.posionCount, equals(5));
    });

    test("attack() 메서드 테스트(일반 공격 동작 확인)", () {
      Hero hero = Hero(name: "아제스", hp: 100);

      Slime slime = Slime("슬라임");

      slime.attack(hero);

      //hero.hp가 10 감소했는지 확인
      //"슬라임X이(가) 공격했다!" 출력이 발생했는지 확인
      expect(hero.hp, equals(90));
    });

    test("attack() 메서드 테스트(poisonCount가 있는 경우 독 공격 확인)", () {
      Hero hero = Hero(name: "아제스", hp: 100);

      PoisonSlime poisonSlime = PoisonSlime("포이즌 슬라임");

      poisonSlime.attack(hero);

      //"추가로, 독 포자를 살포했다!" 출력이 발생했는지 확인

      //hero.hp가 1/5 추가로 감소했는지 확인
      expect(hero.hp, lessThan(100));

      //poisonCount가 1 감소했는지 확인
      expect(poisonSlime.posionCount, equals(4));
    });

    test("attack() 메서드 테스트(poisonCount가 0인 경우 독 공격 안 하는지 확인)", () {
      Hero hero = Hero(name: "아제스", hp: 100);
      PoisonSlime poisonSlime = PoisonSlime("포이즌 슬라임");

      poisonSlime.posionCount = 0;

      poisonSlime.attack(hero);
    });
  });
}
