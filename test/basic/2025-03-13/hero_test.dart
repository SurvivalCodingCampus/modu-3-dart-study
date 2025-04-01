import '../../../assignments/basic/2025-03-13/hero.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  test("hero 메서드 테스트", () {
    // given
    final hero1 = Hero("유저1", 100);
    final hero2 = Hero("유저2", 5);

    // when
    hero1.attack();
    hero2.attack();
    hero1.slip();
    hero2.sleep();

    // then
    expect(hero1.hp, equals(85));
    expect(hero2.hp, equals(100));
  });
}
