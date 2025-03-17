import 'package:modu_3_dart_study/2025-03-17/Person.dart';
import 'package:test/test.dart';

void main(){
  test('Person 클래스', () {
    final Person person = Person("최윤석", 1999);

    expect(person.name, equals("최윤석"));
    expect(person.age, 26);
  });


  test('홍길동, 한석봉의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.', () {
    Map<String, int> data = {
      '홍길동' : 20,
      '한석봉' : 25,
    };

    expect(data, containsPair('홍길동', 20));
    expect(data, containsPair('한석봉', 25));
  });

  test('Person 인스턴스를 생성하고, List에 담습니다. List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.', () {
    List<Person> persons = [
      Person('홍길동', 20),
      Person('한석봉', 25),
    ];

    expect(persons[0].name, equals('홍길동'));
    expect(persons[1].name, equals('한석봉'));
    expect(persons[0].birth, equals(20));
    expect(persons[1].birth, equals(25));
  });
}