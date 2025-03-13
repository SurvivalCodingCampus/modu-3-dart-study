
import 'package:test/test.dart';
import '../../assignments/2025-03-13/src/solution1/cleric.dart';

void main() {
  // 과제1 테스트
  test('성직자 준비 테스트', () {
    // 성직자 준비
    Cleric me = Cleric('강지원');
    // Cleric me = Cleric('강지원', 50, 10);

    // hp값 검증
    expect(me.hp, inInclusiveRange(0, me.maxHp));

    // mp값 검증
    expect(me.mp, inInclusiveRange(0, me.maxMp));
  });

}