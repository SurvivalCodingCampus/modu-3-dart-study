/*
이름을 가지는 Person 클래스를 작성하고, 다음을 수행하는 코드를 작성하시오.
(1) 이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
(2) List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
*/

class Person {
  String name;

  Person({required this.name});
}

void main() {
  List<Person> people = [Person(name: '홍길동'), Person(name: '한석봉')];

  for (final person in people) {
    print(person.name);
  }
}
