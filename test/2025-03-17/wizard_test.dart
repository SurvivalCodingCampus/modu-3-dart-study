import 'package:test/test.dart';

import '../../assignments/2025-03-17/src/solution1/wand.dart';
import '../../assignments/2025-03-17/src/solution1/wizard.dart';

void main() {


  test('Wand class exception 발생 테스트1-1 ) 지팡이의 이름은 3문자 이상이어야 합니다', () {
    // 지팡이 생성
    Wand wand = Wand(name: "서리", power: 20);
    //exception 발생 테스트

    //3이상 검증 (exception을 구현했으므로 검증 필요없음)
    expect(wand.name.length, greaterThanOrEqualTo(3));

  });

  test('Wand class exception 발생 테스트1-2 ) 지팡이의 이름은 3문자 이상이어야 합니다', () {
    // 지팡이 생성
    Wand wand = Wand(name: "서리 지팡이", power: 20);
    wand.name = "서리"; //exception 발생 테스트

    //검증 (exception을 구현했으므로 검증 필요없음)
    // expect(wand.name.length, greaterThanOrEqualTo(3));
  });

  test('Wand class exception 발생 테스트2-1 ) 지팡이의 마력은 0.5 이상 100.0 이하여야 합니다', () {
    // 지팡이 생성
    Wand wand = Wand(name: "서리 지팡이", power: -100);
    //exception 발생 테스트

    //검증 (exception을 구현했으므로 검증 필요없음)
    // expect(wand.power, inInclusiveRange(0.5, 100.0));
  });

  test('Wand class exception 발생 테스트2-2 ) 지팡이의 마력은 0.5 이상 100.0 이하여야 합니다', () {
    // 지팡이 생성
    Wand wand = Wand(name: "서리 지팡이", power: 20);
    //exception 발생 테스트
    wand.power = -100;

    //검증 (exception을 구현했으므로 검증 필요없음)
    // expect(wand.power, inInclusiveRange(0.5, 100.0));
  });


  test('Wizard class exception 발생 테스트 1) 마법사 이름은 3자 이상이어야 합니다.', () {
    // 마법사 준비
    Wizard jn = Wizard(name: '제이');
    //exception 발생 테스트

    //3이상 검증 (exception을 구현했으므로 검증 필요없음)
    // expect(wand.name.length, greaterThanOrEqualTo(3));
  });

  test('Wizard class exception 발생 테스트 2) HP는 0 미만이거나 최대 maxHp를 초과할 수 없습니다.', () {
    // 마법사 준비
    Wizard jn = Wizard(name: '제이나');
    //exception 발생 테스트
    jn.hp = 1000;
    //jn.hp = -100;

    //검증 (exception을 구현했으므로 검증 필요없음)
    expect(jn.hp, inInclusiveRange(0, Wizard.maxHp));
  });

  test('Wizard class exception 발생 테스트 3) MP는 0 미만이거나 최대 maxMp를 초과할 수 없습니다.', () {
    // 마법사 준비
    Wizard jn = Wizard(name: '제이나');
    //exception 발생 테스트
    jn.mp = 1000;
    //jn.mp = -100;

    //검증 (exception을 구현했으므로 검증 필요없음)
    expect(jn.mp, inInclusiveRange(0, Wizard.maxMp));
  });



}




