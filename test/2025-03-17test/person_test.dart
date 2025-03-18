import 'package:modu_3_dart_study/PR2025-03-17/person.dart';
import 'package:test/test.dart';

void main() {
  group('Person클래스 테스트', () {
    test('이름이 맞는지 test', () {
      //given(준비)
      Person person1 = new Person(name: "현수", birthYear: 2000);
      //when(실행)
      //then(검증)
      expect(person1.name, equals("현수"));
    });
    test('출생년도가 맞는지 test', () {
      //given(준비)
      Person person1 = new Person(name: "현수", birthYear: 2000);
      //when(실행)
      //then(검증)
      expect(person1.birthYear, equals(2000));
    });
    test('나이가 맞는지 test', () {
      //given(준비)
      Person person1 = new Person(name: "현수", birthYear: 2000);
      //when(실행)
      //then(검증)
      expect(person1.age, equals(25));
    });
  });
}
