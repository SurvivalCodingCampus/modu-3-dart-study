import 'package:test/test.dart';
import '../../assignments/2025-03-13/cleric.dart';

void main() {
  test('[과제]연습문제1-클레릭생성자만들기', () {
    /* given > when > then 기법을 사용 */

    // 1. given(준비)
    // Cleric 클래스로 인스턴스 생성
    Cleric cleric = Cleric('키키', 20, 10);

    // 2. when(실행)

    // 3. then(검증)
    expect(cleric.name, '키키'); // => 이름
    expect(cleric.hp, inInclusiveRange(0, 50)); // => HP가 범위내에 있는가?
    expect(cleric.maxHp, 50); // => 최대HP
    expect(cleric.mp, inInclusiveRange(0, 10)); // => MP가 범위내에 있는가?
    expect(cleric.maxMp, 10); // => 최대MP
  });

  test('[과제]연습문제2-selfAid()구현', () {
    /* given > when > then 기법을 사용 */

    // 1. given(준비)
    Cleric cleric = Cleric('키키', 20, 10);

    // 2. when(실행)
    cleric.selfAid();

    // 3. then(검증)
    expect(cleric.name, '키키'); // => 이름
    expect(cleric.hp, inInclusiveRange(0, 50)); // => HP가 범위내에 있는가?
    expect(cleric.maxHp, 50); // => 최대HP
    expect(cleric.mp, inInclusiveRange(0, 10)); // => MP가 범위내에 있는가?
    expect(cleric.maxMp, 10); // => 최대MP
  });

  test('[과제]연습문제3-pray()구현', () {
    /* given > when > then 기법을 사용 */

    // 1. given(준비)
    Cleric cleric = Cleric('키키', 20, 10);

    // 2. when(실행)
    cleric.selfAid();
    cleric.pray(3);

    // 3. then(검증) - HP와 MP가 예상대로 변화했는지 검증
    expect(cleric.name, '키키'); // => 이름
    expect(cleric.hp, inInclusiveRange(0, 50)); // => HP가 범위내에 있는가?
    expect(cleric.maxHp, 50); // => 최대HP
    expect(cleric.mp, inInclusiveRange(0, 10)); // => MP가 범위내에 있는가?
    expect(cleric.maxMp, 10); // => 최대MP
  });
}
