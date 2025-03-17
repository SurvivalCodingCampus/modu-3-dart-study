import 'person.dart';

void main() {
  List<Person> people = [
    Person(name: '홍길동', birthYear: 2000),
    Person(name: '한석봉', birthYear: 2001),
  ];

  for (var person in people) {
    print('${person.name}');
  }
}
