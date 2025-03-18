import 'package:modu_3_dart_study/2025-03-17/person.dart';
import 'package:test/test.dart';

void main() {
  //연습문제 1
  Person normalPerson = Person(name: "이윤서", birthYear: 1996);

  test("Person Test", () {
    expect(normalPerson.name, equals("이윤서"));
    expect(normalPerson.birthYear, equals(1996));
    expect(
      normalPerson.age,
      equals(DateTime.now().year - normalPerson.birthYear),
    );
  });

  test("Person List Test", () {
    //연습문제3
    Person hongGilDong = Person(name: "홍길동", birthYear: 1800);
    Person hangSangBong = Person(name: "한석봉", birthYear: 1473);

    List<Person> personList = [hangSangBong, hongGilDong];

    for (Person persons in personList) {
      print("리스트에 ${persons.name}의 이름이 있습니다");
    }
  });
}
