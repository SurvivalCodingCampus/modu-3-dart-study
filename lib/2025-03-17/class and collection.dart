class Person {
  String name;

  Person(this.name);
}

// for 사용
void main() {
  final people = <String>[];

  people.add('홍길동');
  people.add('한석봉');

  for (final e in people) {
    print(e);
  }
}
