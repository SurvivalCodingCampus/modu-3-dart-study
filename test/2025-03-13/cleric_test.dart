
import 'package:test/test.dart';

import '../../assignments/2025-03-13/src/solution2/cleric.dart';
// import '../../assignments/2025-03-13/src/solution1/cleric.dart';

void main() {
  // 과제1 테스트
  test('성직자 준비 테스트', () {
    // 성직자 준비
    Cleric me = Cleric('강지원', 50, 10);
    // Cleric me = Cleric('강지원');

    // hp값 검증
    expect(me.hp, inInclusiveRange(0, me.maxHp));

    // mp값 검증
    expect(me.mp, inInclusiveRange(0, me.maxMp));
  });


  test('성직자 셀프 에이드 시전 테스트', () {
    // 성직자 준비
    Cleric me = Cleric('강지원', 50, 10);
    // Cleric me = Cleric('강지원');

    // 성직자 스킬 시전
    me.selfAid();

    // hp값 검증
    expect(me.hp, inInclusiveRange(0, me.maxHp));

    // mp값 검증
    expect(me.mp, inInclusiveRange(0, me.maxMp));
  });

}