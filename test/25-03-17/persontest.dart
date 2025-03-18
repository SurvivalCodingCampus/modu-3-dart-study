import 'package:test/test.dart';

import '../../assignments/2025-03-17/person.dart';

void main() {
    test('나이 계산이 잘되는지', () {
      Person person = Person("Shin Chan", 1994);
      int now = DateTime.now().year;
      int expectedAge = now - 1994;
      expect(person.age, equals(expectedAge));
    });
}