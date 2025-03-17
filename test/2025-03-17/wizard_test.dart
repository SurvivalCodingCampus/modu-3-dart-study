import 'package:test/test.dart';

import '../../assignments/2025-03-17/src/solution1/wand.dart';
import '../../assignments/2025-03-17/src/solution1/wizard.dart';

void main() {
  test('Wand class exception 발생 테스트1-1 ) 지팡이의 이름은 3문자 이상이어야 합니다', () {
    // // 지팡이 생성
    // Wand wand = Wand(name: "s", power: 20);
    // //exception 발생 테스트
    //
    // //3이상 검증 (exception을 구현했으므로 검증 필요없음)
    // expect(wand.name.length, greaterThanOrEqualTo(3));

    expect(
      () => Wand(name: "서리", power: 20),
      throwsException,
    ); // 의도대로 잘못된 값 입력한 경우 excetion이 발생했으므로 정상
  });

  test('Wand class exception 발생 테스트1-2 ) 지팡이의 이름은 3문자 이상이어야 합니다', () {
    // 지팡이 생성
    Wand wand = Wand(name: "서리 지팡이", power: 20);
    /*
       wand.name = "s"; //exception 발생 테스트

    //검증 (exception을 구현했으므로 검증 필요없음)
    expect(wand.name.length, greaterThanOrEqualTo(3));

    */
    expect(
      () => wand.name = "s",
      throwsException,
    ); // 의도대로 잘못된 값 입력한 경우 excetion이 발생했으므로 정상
  });

  test('Wand class exception 발생 테스트2-1 ) 지팡이의 마력은 0.5 이상 100.0 이하여야 합니다', () {
    /*
    // 지팡이 생성
    Wand wand = Wand(name: "서리 지팡이", power: -100);
     //exception 발생 테스트

    expect(wand.power, inInclusiveRange(0.5, 100.0));
*/

    expect(
      () => Wand(name: "서리", power: -100),
      throwsException,
    ); // exception 발생 안함..

    expect(
      () => Wand(name: "서리", power: 1000),
      throwsException,
    ); // 의도대로 잘못된 값 입력한 경우 excetion이 발생했으므로 정상
  });

  test('Wand class exception 발생 테스트2-2 ) 지팡이의 마력은 0.5 이상 100.0 이하여야 합니다', () {
    // 지팡이 생성
    Wand wand = Wand(name: "서리 지팡이", power: 20);
    /*
    //exception 발생 테스트
    wand.power = 1000;
    // wand.power = -100;
    //
    // //검증 (exception을 구현했으므로 검증 필요없음)
    // expect(wand.power, inInclusiveRange(0.5, 100.0));
*/
    expect(
          () => wand.power = -100,
      throwsException,
    ); // 의도대로 잘못된 값 입력한 경우 excetion이 발생했으므로 정상

    expect(
          () => wand.power = 1000,
      throwsException,
    ); // 의도대로 잘못된 값 입력한 경우 excetion이 발생했으므로 정상

  });

  test('Wizard class exception 발생 테스트 1) 마법사 이름은 3자 이상이어야 합니다.', () {
    /*
    // 마법사 준비
    Wizard jn = Wizard(name: '제이');
    //exception 발생 테스트

    //3이상 검증 (exception을 구현했으므로 검증 필요없음)
    expect(jn.name.length, greaterThanOrEqualTo(3));
*/

    expect(
          () => Wizard(name: "s"),
      throwsException,
    ); // 의도대로 잘못된 값 입력한 경우 excetion이 발생했으므로 정상

  });

  test(
    'Wizard class exception 발생 테스트 2) HP는 0 미만이거나 최대 maxHp를 초과할 수 없습니다.',
    () {
      // 마법사 준비
      Wizard jn = Wizard(name: '제이나');

      /*
      //exception 발생 테스트
      jn.hp = 1000;
      // jn.hp = -100;
    */

      expect(
            () => jn.hp = 101,
        throwsException,
      ); // 의도대로 잘못된 값 입력한 경우 excetion이 발생했으므로 정상


      //음수 입력시 0으로 변환되는 것을 위한 범위 검증
      expect(jn.hp, inInclusiveRange(0, Wizard.maxHp));
    },
  );

  test(
    'Wizard class exception 발생 테스트 3) MP는 0 미만이거나 최대 maxMp를 초과할 수 없습니다.',
    () {
      // 마법사 준비
      Wizard jn = Wizard(name: '제이나');

      /*
      //exception 발생 테스트
      jn.mp = 1000;
      //jn.mp = -100;
    */

      expect(
            () => jn.mp = -2,
        throwsException,
      ); // 의도대로 잘못된 값 입력한 경우 excetion이 발생했으므로 정상


      expect(
            () => jn.mp = 22,
        throwsException,
      ); // 의도대로 잘못된 값 입력한 경우 excetion이 발생했으므로 정상


      //그냥 해본 범위 검증
      expect(jn.mp, inInclusiveRange(0, Wizard.maxMp));
    },
  );
}
