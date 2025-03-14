import 'package:modu_3_dart_study/PR2025-03-13/prCleric.dart';
import 'package:test/test.dart';

void main() {
  test('Cleric Test', () {
    //given(준비)
    Cleric cleric = Cleric();
    //when(실행)
    cleric.selfAid();
    cleric.pray(6);
    //then(검증)
    expect(cleric.mp, inInclusiveRange(0, 10));
    expect(cleric.hp, equals(50));
  });
}
