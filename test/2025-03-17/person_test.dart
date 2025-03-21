import '../../assignment/2025-03-17/person.dart';
import 'package:test/test.dart';

void main() {
  group('Person 테스트', () {
    test('올 해 년도에서 birth 년도를 뺀 값을 리턴한다.(만 나이)', () {
      final datetime = DateTime.now();
      final currentYear = datetime.year;

      final person = Person(name: '홀길동', birthYear: 2001);

      expect(person.age, currentYear - person.birthYear);
    });
  });
}