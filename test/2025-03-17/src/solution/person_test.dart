import 'package:test/test.dart';

import '../../../../assignments/2025-03-17/src/solution/person.dart';

void main() {
  test('Person 테스트', () {
    // given
    Person person = Person(name: '홍길동', birthYear: 2000);

    // then
    expect(person.name, equals('홍길동'));
    expect(person.age, equals(25));
  });
}
