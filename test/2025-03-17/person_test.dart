import 'package:test/test.dart';

import '../../assignments/2025-03-17/src/solution1/person.dart';

void main() {
  //콜렉션 연습문제 1번
  // TIL 작성

  //콜렉션 연습문제 2번
  test('콜렉션 연습문제 2 - 컬렉션 모두 출력', () {
    Map<String, int> profile = {'홍길동': 20, '한석봉': 25};

    profile.forEach((name, age) {
      print('$name의 나이는 $age입니다.');
    });
  });

  // List<Person> list = [Person(name: '한석봉', birthYear: 1900), Person(name: '홍길동', birthYear: 1901)];

  //콜렉션 연습문제 3번
  test('콜렉션 연습문제 3 - 이름을 가지는 Person 클래스를 작성 후 List에 담기 ', () {
    Person han = Person(name: '한석봉', birthYear: 1900);
    Person hong = Person(name: '홍길동', birthYear: 1901);

    List<Person> list = [];

    list.add(han);
    list.add(hong);
  });

  test('콜렉션 연습문제 3 - 위의 List 출력하기 ', () {
    List<Person> list = [
      Person(name: '한석봉', birthYear: 1900),
      Person(name: '홍길동', birthYear: 1901),
    ];
    list.forEach((person) => print(person.name));
    // list.forEach((person) => print(person.name));
  });
}
