import 'package:test/test.dart';

import '../../assignments/2025-03-14/cleric_ver2.dart';

void main() {
  test('클레릭 생성자 테스트', () {
    // given
    final Cleric cleric1 = Cleric('아서스', hp: 40, mp: 5);
    final Cleric cleric2 = Cleric('아서스', hp: 35);
    final Cleric cleric3 = Cleric('아서스');
    // final Cleric cleric4 = Cleric();

    // when
    cleric1.hp = 11;
    cleric2.hp = 22;
    cleric3.hp = 33;
    // then
    expect(cleric1.hp, equals(11));
    expect(cleric2.hp, equals(22));
    expect(cleric3.hp, equals(33));

    expect(cleric1.mp, equals(5));
    expect(cleric2.mp, equals(10));
    expect(cleric3.mp, equals(10));
  });
}
