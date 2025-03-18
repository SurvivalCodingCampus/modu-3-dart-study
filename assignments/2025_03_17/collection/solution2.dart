// 연습 문제 3

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}

void main() {
  Person gildong = Person(name: '홍길동', age: 20);
  Person seokbong = Person(name: '한석봉', age: 25);

  List<Person> people = [];

  people.add(gildong);
  people.add(seokbong);

  for (int i = 0; i < people.length; i++) {
    print(people[i].name);
  }
}
