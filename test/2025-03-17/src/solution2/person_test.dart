import 'package:modu_3_dart_study/assignments/2025-03-17/src/solution2/question3.dart';
import 'package:test/test.dart';

void main() {
  test('문제 2번 테스트', () {
    // given
    Map<String, int> people = {'홍길동': 20, '한석봉': 25};

    // then
    expect(people['홍길동'], equals(20));
    expect(people['한석봉'], equals(25));
  });

  test('문제 3번 테스트', () {
    // given
    List<Person> people = [Person(name: '홍길동'), Person(name: '한석봉')];

    // then
    expect(people[0].name, equals('홍길동'));
    expect(people[1].name, equals('한석봉'));
  });
}
