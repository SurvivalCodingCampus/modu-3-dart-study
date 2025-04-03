import 'package:test/test.dart';

import '../../../lib/assignments/basic/2025-03-18/hero.dart';
import '../../../lib/assignments/basic/2025-03-18/slime.dart';

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

    test(("poisonCount is 0 test"), () {
      // given
      final hero = Hero("용사", Hero.maxHp);
      poisonSlime.poisonCount = 0;

      // when
      poisonSlime.attack(hero);

      // then
      expect(hero.hp, 90);
    });
  });
}
