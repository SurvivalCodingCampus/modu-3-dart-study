import 'package:modu_3_dart_study/2025-03-17/person.dart';
import 'package:test/test.dart';

void main() {
  group('연습문제2', () {
    Person p1 = Person('선호', 1999);

    test('이름과 태어난 해', () {
      expect(p1.name, equals('선호'));
      expect(p1.birthYear, equals(1999));
    });
    test('이름, 태어난 해 지정', (){
      final name = p1.name;
      final birthYear = p1.birthYear;
      expect(p1.name, equals(name));
      expect(p1.birthYear, equals(birthYear));
    });
    test('age 및 나이 계산', (){
      final age = DateTime.now().year - p1.birthYear;
      expect(age, equals(26));
    });

  });
}
