import 'package:test/test.dart';

import '../../../../assignments/2025-03-13/src/solution/cleric.dart';

void main() {
  test('Cleric - selfAid 테스트', () {
    // selfAid 테스트
    // given(준비)
    Cleric cleric = Cleric("성직자");

    // when(실행)
    cleric.selfAid(); // mp -> 5

    // then(검증)
    expect(cleric.mp, equals(5));
    expect(cleric.hp, equals(50));
  });

  test('Cleric - pray 테스트', () {
    // pray 테스트
    // given(준비)
    Cleric cleric = Cleric("성직자");

    // when(실행)
    cleric.selfAid(); // mp -> 5
    cleric.pray(3); // mp -> 8 ~ 10 사이의 숫자

    // then(검증)
    expect(cleric.mp, inInclusiveRange(8, 10));
  });
}
