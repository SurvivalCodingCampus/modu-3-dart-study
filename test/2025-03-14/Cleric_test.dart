
import 'package:test/test.dart';
import '../../assignments/2025-03-14/Cleric.dart';

void main() {
  test('Cleric selfAid() 테스트 : 회복 성공', () {
    // given(준비)
    final cleric = Cleric('성직자', 30, 5);

    // when(실행)
    cleric.selfAid();

    // then(검증)
    expect(cleric.hp, equals(50));
    print(cleric.hp.toString());
  });

  test('Cleric selfAid() 테스트 : 회복 실패', () {
    // given(준비)
    final cleric = Cleric('성직자', 30, 4);   //mp 부족

    // when(실행)
    cleric.selfAid();

    // then(검증)
    expect(cleric.hp, equals(30));
    expect(cleric.mp, equals(4));
  });

  test('Cleric pray() 테스트 : 기도 시간 0일때', () {
    // given(준비)
    final cleric = Cleric('성직자', 30, 5);
    const int sec = 0;
    // when(실행)
    cleric.pray(sec);

    // then(검증)
    expect(cleric.mp, equals(5));
  });

  test('Cleric pray() 테스트 : 기도 시간 1일때', () {
    // given(준비)
    final cleric = Cleric('성직자', 30, 5);

    // when(실행)
    cleric.pray(1);

    // then(검증)
    expect(cleric.mp, inInclusiveRange(6, 8) );
  });

  test('Cleric pray() 테스트 : 기도 시간 10일때', () {
    // given(준비)
    final cleric = Cleric('성직자', 30, 5);

    // when(실행)
    final int recoveryAmount = cleric.pray(10);

    // then(검증)
    expect(cleric.mp,equals(10));
  });


}
