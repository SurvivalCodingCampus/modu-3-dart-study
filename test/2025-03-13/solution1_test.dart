import 'package:test/test.dart';

import '../../assignments/2025-03-13/solution1.dart';

void main() {
  //연습 문제 2
  test('Self Aid 사용', () {
    final Cleric cleric = Cleric(30, 10, '유준');

    cleric.selfAid();

    expect(cleric.hp, equals(50)); // 최대 체력으로 바뀌었는지 체크
    print(cleric.hp);
    expect(cleric.mp, equals(5)); // mp 가 10 에서 5 로 바뀌었는지 체크
    print(cleric.mp);
  });

  //연습 문제 3
  test('pray 사용', () {
    final Cleric cleric = Cleric(50, 5, '유준1');

    int mp = cleric.pray(4); //기존 mp 5 에서 4~6 사이 회복
    print(mp);
  });
}
