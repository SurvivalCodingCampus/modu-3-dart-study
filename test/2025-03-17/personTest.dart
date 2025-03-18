import 'package:test/test.dart';
import '../../assignments/2025-03-17/person.dart';

void main() {
  Person person1 = Person(name: "홍길동", birthYear: 2003);
  Person person2 = Person(name: "한석봉", birthYear: 1998);

  print("${person1.name}의 나이는 ${person1.age}살");
  print("${person2.name}의 나이는 ${person2.age}살");
}