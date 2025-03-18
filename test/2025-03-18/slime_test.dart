import 'package:test/test.dart';

import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/slime.dart';

void main() {
  group("posion slime test", () {
    // slime instance
    final String slimeName = "모두의 연구소";
    final poisonSlime = PoisonSlime(slimeName);

    test(("constructure test"), () {
      expect(poisonSlime.suffix, slimeName);
      expect(poisonSlime.poisonCount, PoisonSlime.initialPoisonCount);
    });

    test(("attack test"), () {
      // given
      final hero = Hero("용사", Hero.maxHp);

      // when
      poisonSlime.attack(hero);

      // then
      expect(hero.hp, 72);
    });
  });
}
