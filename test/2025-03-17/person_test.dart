import 'package:test/test.dart';

import 'package:modu_3_dart_study/assignments/2025-03-17/person.dart';

void main() {
  group('Person 클래스 테스트', () {
    test('이름과 태어난 해 정상적으로 저장되는지 확인', () {
      final Person p1 = Person(name: '지롱', birthYear: 1997);

      expect(p1.name, equals('지롱'));
      expect(p1.birthYear, equals(1997));
    });

    test('나이 계산이 현재 연도 기준으로 정상 동작하는지 확인', () {
      final currentYear = DateTime.now().year;
      final p1 = Person(name: '지롱', birthYear: 1997);

      expect(p1.age, equals(currentYear - 1997)); // 나이 = 현재 연도 - 태어난 해
    });

    test('나이를 임의로 수정할 수 없는지 확인', () {
      final p1 = Person(name: '지롱', birthYear: 1997);
      // p1.age = 30; // age는 setter가 없으므로 컴파일 오류 발생
    });
  });

  group('컬렉션의 응용', () {
    test('person 꺼내오기', () {
      List<Map<String, dynamic>> persons = [
        {'name': '홍길동', 'age': 20},
        {'name': '한석봉', 'age': 25},
      ];

      List<String> results = [];

      for (final person in persons) {
        final name = person['name']; // 이름
        final age = person['age']; // 나이

        print('$name의 나이는 $age살');
        results.add('$name의 나이는 $age살');
      }

      // 검증: 예상한 출력 값들과 일치하는지 확인
      expect(results, ['홍길동의 나이는 20살', '한석봉의 나이는 25살']);
    });

    test('클래스와 컬랙션응용', () {
      Person person1 = Person(name: '홍길동');
      Person person2 = Person(name: '한석봉');

      List<Person> persons = [person1, person2];

      for (final person in persons) {
        print('${person.name}');
      }
    });
  });
}
