class Person {
  final List<Person> names = [];
  String name;

  Person({required this.name});

  void addList(Person person) {
    names.add(person);
  }
}

void main() {
  Person gilDong = Person(name: '홍길동');
  Person seokBong = Person(name: '한석봉');

  gilDong.addList(gilDong);
  gilDong.addList(seokBong);

}
