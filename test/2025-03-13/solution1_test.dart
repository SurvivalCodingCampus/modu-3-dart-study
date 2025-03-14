import 'package:test/test.dart';

import '../../assignments/2025-03-13/solution1.dart';

void main() {
  //연습 문제 2
  test('Self Aid 사용', () {
    final Cleric cleric = Cleric(30, 10, '유준');

    cleric.selfAid();
    // 최대 체력으로 바뀌었는지 체크
    expect(cleric.hp, equals(50));
    print(cleric.hp);

    // mp 가 10 에서 5 로 바뀌었는지 체크
    expect(cleric.mp, equals(5));
    print(cleric.mp);
  });

  //연습 문제 3
  test('pray 사용', () {
    final Cleric cleric = Cleric(50, 5, '유준1');
    int initialMp = cleric.mp;

    // 기존 mp 5 에서 4~6 사이 회복
    int mp = cleric.pray(4);

    // mp 가 정상적으로 회복 됐는지 확인
    expect(mp, greaterThan(initialMp));
    // maxMp 를 넘지 않았는지 확인
    expect(mp, lessThanOrEqualTo(cleric.maxMp));

    print(mp);
  });
}
