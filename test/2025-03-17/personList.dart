import 'package:test/test.dart';
import '../../assignments/2025-03-17/personList.dart';

void main() {
  List<Person> people = [
    Person(name: "홍길동"),
    Person(name: "한석봉"),
  ];

  for (var person in people) {
    print(person.name);
  }
}