import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../assignments/2025-03-17/person.dart';

void main() {
  test("컬렉션 값 출력", () {
    final people = {"홍길동": 20, "한석봉": 25};

    for (final person in people.entries) {
      print("${person.key}의 나이는 ${person.value}살");
    }
  });

  test("컬렉션과 클래스 값 출력", () {
    final gildong = Person(name: "홍길동", year: 2005);
    final sukbong = Person(name: "한석봉", year: 2000);

    final List<Person> people = [gildong, sukbong];

    for (final person in people) {
      print(person.name);
    }
  });
}
