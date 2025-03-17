class Person{
  String name;
  Person(this.name);
}


void main() {
  final people = <String>[];

  people.add('홍길동');
  people.add('한석봉');

  print(people);
}