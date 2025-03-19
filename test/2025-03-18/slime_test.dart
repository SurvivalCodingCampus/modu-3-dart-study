import 'package:test/test.dart';
import '../../assignments/2025-03-18/poison_slime.dart';
import '../../assignments/2025-03-18/hero.dart';
import '../../assignments/2025-03-18/slime.dart';

void main() {
  group('[Slime]', () {
    test('suffix', () {
      PoisonSlime poisonSlime = PoisonSlime('A');

      expect(poisonSlime.suffix, equals('A'));
    });

    test('attack', () {
      PoisonSlime poisonSlime = PoisonSlime('A');
      Hero hero = Hero('박성민', 50);

      poisonSlime.attack(hero);

      expect(poisonSlime.poisonCount, equals(5));
    });
  });
}