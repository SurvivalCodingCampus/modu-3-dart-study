import 'package:modu_3_dart_study/2025-03/2025-03-17/collection/person.dart';
import 'package:test/test.dart';

void main() {
  test('이름이 홍길동, 한석봉인 Person 인스턴스를 생성하고 List에 담아 모두 출력해야한다.', () {
    // Given
    final List<Person> people = [];
    final Person gildong = Person(name: '홍길동');
    final Person seokbong = Person(name: '한석봉');

    // When
    people.add(gildong);
    people.add(seokbong);

    // Then
    for (final person in people) {
      expect(person.name, anyOf(equals('홍길동'), equals('한석봉')));
    }
  });
}
