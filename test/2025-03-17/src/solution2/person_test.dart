import 'package:test/test.dart';

import '../../../../assignments/2025-03-17/src/solution2/question2.dart';

void main() {
  test('문제 2번 테스트', () {
    // given
    List<Person> people = [Person(name: '홍길동'), Person(name: '한석봉')];

    // then
    expect(people[0].name, equals('홍길동'));
    expect(people[1].name, equals('한석봉'));
  });

  test('문제 3번 테스트', () {
    // given
    List<Person> people = [Person(name: '홍길동'), Person(name: '한석봉')];
    Map<String, int> profile = {};

    // when
    for (final person in people) {
      Map<String, int> newValue = <String, int>{
        person.name: person.name == "홍길동" ? 20 : 25,
      };
      profile.addEntries(newValue.entries);
    }

    // then
    expect(profile['홍길동'], equals(20));
    expect(profile['한석봉'], equals(25));
  });
}
