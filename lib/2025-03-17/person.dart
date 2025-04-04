class Person {
  final String _name;
  final int _birthYear;

  Person(this._name, this._birthYear);

  String get name => _name;
  int get birthYear => _birthYear;

  int get age => DateTime.now().year - birthYear;
}

void main() {
  Person person1 = Person('홍길동', 2006);
  Person person2 = Person('한석봉', 2001);

  List<Person> people = [];
  people.add(person1);
  people.add(person2);

  people.forEach((person) {
    print(person.name);  
  });
}