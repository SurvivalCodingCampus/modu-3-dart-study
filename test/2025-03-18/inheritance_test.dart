import 'package:test/test.dart';

import '../../assignments/2025-03-18/inheritance_assignment.dart';

void main() {
  // 이 클래스를 이용해, 다음 사양을 따르는 PoisonSlime 클래스를 작성하시오
  // 독 슬라임(PoisonSlime) 은, 슬라임 (Slime) 중에서도 특히 “독 공격" 이 되는 것
  // PoisonSlime 는 아래의 코드로 인스턴스화 되는 클래스임
  // PoisonSlime poisonSlime = PoisonSlime(‘A’);
  // PoisonSlime 독 공격 가능 횟수를 저장하는 poisonCount(초기값 5)를 가진다
  // PoisonSlime attack() 메소드가 호출되면 다음 내용의 공격을 한다
  // 우선, “보통 슬라임과 같은 공격"을 한다
  // poisonCount가 0이 아니면 다음을 추가로 수행한다
  // 화면에 “추가로, 독 포자를 살포했다!” 를 표시
  // 용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고, “~포인트의 데미지" 라고 표시
  // poisonCount 를 1 감소 시킨다
  test('독슬라임 테스트', () {
    //given
    PoisonSlime poisonSlime1 = PoisonSlime("독슬라임");
    Slime slime1 = Slime('그냥 슬라임');
    Hero hero1 = Hero('무면허 라이더', Hero.maxHp);

    //when, then
    slime1.attack(hero1);
    expect(hero1.hp, equals(Hero.maxHp - 10));
    print('히어로의 현재 HP : ${hero1.hp}');
    poisonSlime1.attack(hero1);
    expect(hero1.hp, inInclusiveRange(0, Hero.maxHp));
    print('히어로의 현재 HP : ${hero1.hp}');
  });

  test('위자드 테스트', () {
    //given
    Wizard wizard1 = Wizard(name: '탈진한 힐러', hp: 100, mp: 9);
    Wizard wizard2 = Wizard(name: '쌩쌩한 힐러', hp: 100);
    Hero hero2 = Hero('죽기직전의 히어로', 1);

    //when
    wizard1.heal(hero: hero2);
    print('히어로의 현재 HP : ${hero2.hp}');
    wizard2.heal(hero: hero2);
    print('히어로의 현재 HP : ${hero2.hp}');

    //then
    expect(wizard1.mp, equals(9));
    expect(wizard2.mp, lessThan(95));
    expect(hero2.hp, greaterThan(1));
  });

  test('그레이트위자드 테스트', () {
    //given
    GreatWizard greatWizard1 = GreatWizard(name: '지쳐버린 힐러의 왕', hp: 200, mp: 49);

    GreatWizard greatWizard2 = GreatWizard(name: '힐러의 왕', hp: 200);

    Hero hero3 = Hero('쓰러진 히어로', 2);

    //when
    greatWizard1.superHeal(hero: hero3);
    greatWizard2.superHeal(hero: hero3);

    //then
    expect(hero3.hp, equals(Hero.maxHp));
    expect(greatWizard1.mp, equals(49));
    expect(greatWizard2.mp, equals(GreatWizard.baseMp - 50));
  });
}
