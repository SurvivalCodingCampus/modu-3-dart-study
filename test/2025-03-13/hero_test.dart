import 'package:modu_3_dart_study/2025-03-13/hero.dart';
import 'package:test/test.dart';

void main() {
  test('Hero attack 테스트', () {
    // 준비
    Hero hero = Hero('홍길동', 100);

    // 실행
    hero.attack();

    // 검증
    expect(hero.hp, equals(95));
  });

  test('Hero 테스트', () {
    // 준비
    Hero hero = Hero('홍길동', 50);

    // 실행
    hero.sleep();

    // 검증
    expect(hero.hp, equals(100));
  });
}