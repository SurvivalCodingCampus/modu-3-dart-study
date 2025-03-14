
import 'package:test/test.dart';

import '../../assignments/2025-03-14/src/solution1/cleric.dart';

void main() {
  // 과제1-1 테스트

  test('성직자 최대 HP, MP 테스트', () {

    // 성직자 준비
    Cleric woo = Cleric('우서', hp: 50, mp: 10);
    Cleric ahn = Cleric('안두인', hp: 40, mp: 10);

    //error : hp 값 최대값 초과
    // Cleric ahn = Cleric('안두인', hp: 100, mp: 10);

    //error : mp 값 최대값 초과
    // Cleric woo = Cleric('안두인', hp: 50, mp: 99);

    // 우서 최대 hp,mp값 범위 검증
    expect(woo.hp, inInclusiveRange(0, Cleric.maxHp));
    expect(woo.mp, inInclusiveRange(0, Cleric.maxMp));

    // 안두인 최대 hp,mp값 범위 검증
    expect(ahn.hp, inInclusiveRange(0, Cleric.maxHp));
    expect(ahn.mp, inInclusiveRange(0, Cleric.maxMp));
  });



  // 과제1-2 테스트

  test('생성자 검증 A: 전체', () {

    Cleric cA = Cleric('성직자A', hp: 50, mp: 10);

    // 우서 최대 hp,mp값 범위 검증
    expect(cA.hp, inInclusiveRange(0, Cleric.maxHp));
    expect(cA.mp, inInclusiveRange(0, Cleric.maxMp));

  });

  test('생성자 검증 B: mp 생략 (mp = 초기값)', () {

    Cleric cB = Cleric('성직자B', hp: 50);

    // 우서 최대 hp,mp값 범위 검증
    expect(cB.hp, inInclusiveRange(0, Cleric.maxHp));
    expect(cB.mp, inInclusiveRange(0, Cleric.maxMp));

  });

  test('생성자 검증 C: hp 생략 (hp = 초기값)', () {

    Cleric cC = Cleric('성직자C', mp: 10);

    // 우서 최대 hp,mp값 범위 검증
    expect(cC.hp, inInclusiveRange(0, Cleric.maxHp));
    expect(cC.mp, inInclusiveRange(0, Cleric.maxMp));

  });

  test('생성자 검증 D: hp, mp 생략 (hp,mp = 초기값)', () {

    Cleric cD = Cleric('성직자D');

    // 우서 최대 hp,mp값 범위 검증
    expect(cD.hp, inInclusiveRange(0, Cleric.maxHp));
    expect(cD.mp, inInclusiveRange(0, Cleric.maxMp));

  });

  test('생성자 검증 E: 생성자 name 누락 오류', () {

    Cleric cD = Cleric();

    // 우서 최대 hp,mp값 범위 검증
    expect(cD.hp, inInclusiveRange(0, Cleric.maxHp));
    expect(cD.mp, inInclusiveRange(0, Cleric.maxMp));

  });

}