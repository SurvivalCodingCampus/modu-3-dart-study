import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-17/person.dart';

void main() {
    test('Test names and ages', () {
      // Person 객체 생성
      final person1 = Person('홍길동', 20);
      final person2 = Person('한석봉', 25);

      // 출력 값이 예상한 대로 나오는지 확인
      expect('${person1.name}의 나이는 ${person1.birthYear}살', '홍길동의 나이는 20살');
      expect('${person2.name}의 나이는 ${person2.birthYear}살', '한석봉의 나이는 25살');
    });
}