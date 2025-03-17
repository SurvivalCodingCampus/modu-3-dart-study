import 'package:test/test.dart';

import '../../assignments/2025-03-17/person.dart';

void main() {
  group('person', () {
    test('사람 생성 성공', () {
      // given
      Person person = Person(name: '유제환', birthYear: 1999);

      // then
      expect(person, isA<Person>());
      expect(person.name, equals('유제환'));
      expect(person.birthYear, equals(1999));
      expect(person.age, equals(26));
    });
  });
}
