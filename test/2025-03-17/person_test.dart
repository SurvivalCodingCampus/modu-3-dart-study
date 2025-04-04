import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-17/person.dart';

void main() {
  group('Person Class Tests', () {
    test('Person name and birthYear are set correctly', () {
      final person = Person('홍길동', 2006);

      // 이름과 태어난 해가 제대로 설정되었는지 확인
      expect(person.name, '홍길동');
      expect(person.birthYear, 2006);
    });

    test('Age is calculated correctly', () {
      final person = Person('한석봉', 2001);

      // 올해가 2025년이라 가정하고 나이를 계산
      final currentYear = DateTime.now().year;
      final expectedAge = currentYear - 2001;

      // 나이가 올바르게 계산되었는지 확인
      expect(person.age, expectedAge);
    });

    test('Test names in List', () {
      // Person 객체 생성
      final person1 = Person('홍길동', 2006);
      final person2 = Person('한석봉', 2001);

      // Person 객체들을 List에 담기
      List<Person> people = [person1, person2];

      // List에 담긴 모든 Person 인스턴스의 이름을 확인
      List<String> names = people.map((person) => person.name).toList();

      // 이름이 리스트에 제대로 담겼는지 확인
      expect(names, ['홍길동', '한석봉']);
    });
  });
}