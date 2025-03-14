import 'package:test/test.dart';

import '../../../../assignments/2025-03-13/src/solution/cleric.dart';

void main() {
  test('문제1 테스트 - 공유필드 여부 확인', () {
    // given(준비)

    // when(실행)

    // then(검증)
    expect(Cleric.maxHp, equals(50));
    expect(Cleric.maxMp, equals(10));
  });

  test('문제2 테스트 - 이름, hp, mp를 생성장에서 지정한 경우', () {
    // given(준비)
    Cleric cleric = Cleric("성직자", hp: 30, mp: 5);

    // when(실행)

    // then(검증)
    expect(cleric.hp, equals(30));
    expect(cleric.mp, equals(5));
  });

  test('문제2 테스트 - 이름만 생성자에서 지정한 경우', () {
    // given(준비)
    Cleric cleric = Cleric("성직자");

    // when(실행)

    // then(검증)
    expect(cleric.hp, equals(50)); // 미지정 시 maxHp값으로 설정
    expect(cleric.mp, equals(10)); // 미지정 시 maxMp값으로 설정
  });
}
