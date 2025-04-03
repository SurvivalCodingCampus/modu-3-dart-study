import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../../lib/assignments/2025-03-/2025-03-17/person.dart';

void main() {
  test("person 객체 및 나이 계산 테스트", () {
    // given
    final person = Person(name: "임명우", year: 2000);

    // when
    final age = person.age;
    final name = person.name;

    // then
    expect(age, 25);
    expect(name, "임명우");
  });
}
