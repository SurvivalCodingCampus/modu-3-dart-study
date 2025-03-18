import 'person.dart';

void main() {
  //제네릭-> type 을 일반화, people 리스트는 Person 객체만 저장할 수 있도록 제한
  //제네릭 사용 안하면 dynamic 사용 -> 다른 값도 들어가 오류 일어날 가능성 많음.
  //제네릭 없이도 가능하긴 함.

  List <Person> people = [
    Person('홍길동', 2005),
    Person('한석봉', 2003),
  ];
  for (var person in people) {
    print('people에 있는 사람 이름은 ${person.name}');
  }
}