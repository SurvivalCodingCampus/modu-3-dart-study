import '../../../lib/assignments/2025-03-/2025-03-13/cleric.dart';
import 'package:test/test.dart';

void main() {
  test("cleric 메서드 테스트", () {
    // given
    final cleric1 = Cleric("법사1");

    // when
    cleric1.hp = 1;

    cleric1.selfAid();
    final recoveredMp = cleric1.pray(3);
    print("mp 회복량: $recoveredMp");

    // then
    expect(cleric1.hp, equals(50));
    expect(cleric1.mp, equals(5 + recoveredMp));
  });
}
