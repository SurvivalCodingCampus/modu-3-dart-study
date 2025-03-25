import 'package:test/test.dart';

import '../../../assignments/2025-03/2025-03-13/cleric.dart';

void main() {
  test("클레릭 테스트", () {
    //given(준비)
    final cleric = Cleric("클레릭", 50, 10);

    //when(실행)
    cleric.hp = 20;
    cleric.selfAid();
    cleric.hp = 21;
    cleric.selfAid();
    cleric.hp = 22;
    cleric.selfAid();

    cleric.pray(0);
    cleric.pray(1);
    cleric.pray(2);
    cleric.pray(3);

    cleric.selfAid();
    //then(검증)
    expect(cleric.hp, equals(cleric.maxHp));
  });
}
