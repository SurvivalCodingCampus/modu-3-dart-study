import 'package:modu_3_dart_study/assignments/2025-03-17/src/solution1/person.dart';
import 'package:test/test.dart';

void main() {
  test('Person 테스트', () {
    // given
    Person person = Person(name: '홍길동', birthYear: 2000);

    // then
    expect(person.name, equals('홍길동'));
    expect(person.age, equals(25));
  });
}
