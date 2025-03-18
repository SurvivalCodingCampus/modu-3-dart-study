void main() {
  Person person = Person('선호', 1999);
  print(person.age);
}

class Person {
  final String name;
  final int birthYear;
  int _age;

  Person(this.name, this.birthYear) : _age = DateTime.now().year - birthYear;

  int get age => _age;
}
