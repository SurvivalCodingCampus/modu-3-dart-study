// 연습 문제 2

class PersonCapsul {
  final String name;
  final int birthYear;

  final int _age;

  PersonCapsul({required this.name, required this.birthYear})
    : _age = DateTime.now().year - birthYear;

  int get age => _age;
}

void main() {
  PersonCapsul person = PersonCapsul(name: '유준', birthYear: 1997);

  // 28
  print(person.age);

  // 변경 불가능 ! setter 가 없기 때문.
  // person.age = 25;
}
