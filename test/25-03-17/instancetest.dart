import 'package:test/test.dart';

import '../../assignments/2025-03-17/person.dart';

void main () {
  test('list instance test', () {
  List <Person> people = [
  Person('홍길동', 2005),
  Person('한석봉', 2003),
  ];

  expect(people[0].name, equals('홍길동'));
  expect(people[1].birthYear, equals(2003));

  });
}