import 'package:modu_3_dart_study/2025-03-17/collection_3.dart';
import 'package:test/test.dart';

void main() {
  test('Person 인스턴스, List', () {
    Person people = Person();
    people.printStudent();

    expect(people.students.length, equals(2));
    expect(people.students[0]['name'], '홍길동');
    expect(people.students[1]['name'], '한석봉');
  });
}
