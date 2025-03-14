import 'package:modu_3_dart_study/2025-03-13/hero.dart';
import 'package:test/test.dart';

void main() {
  test('[수업]클래스와 인스턴스-Hero-테스트1', () {
    /* given > when > then 기법을 사용 */

    // 1. given(준비)
    // Hero 클래스로 두개의 인스턴스 생성
    Hero heroBunny = Hero('jilong🐰', 100);

    // 2. when(실행)
    //  -> heroBunny 공격받고 잠자서 회복하기
    heroBunny.attack();
    heroBunny.sleep();

    // 3. then(검증)
    expect(heroBunny.hp, equals(100));
  });
  test('[수업]클래스와 인스턴스-Hero-테스트2', () {
    // 1. given(준비)
    Hero heroTiger = Hero('youngQ🐯', 80);

    // 2. when(실행)
    //  -> heroTiger 도망가다 공격받기
    heroTiger.attack();
    heroTiger.sleep();

    // 3. then(검증)
    expect(heroTiger.hp, equals(100));
  });
}
