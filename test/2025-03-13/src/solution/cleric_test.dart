import 'package:test/test.dart';

import '../../../../assignments/2025-03-13/src/solution/cleric.dart';

void main() {
  test('Cleric - selfAid 테스트', () {
    // given(준비)
    Cleric cleric = Cleric("성직자");

    // when(실행)
    cleric.selfAid();

    // then(검증)
    expect(cleric.mp, equals(5));
  });
}
