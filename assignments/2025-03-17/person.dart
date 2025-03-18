class Person {
  final String name;
  final int birthYear;

  int get age {
    final currentDateTime = DateTime.now();
    final currentYear = currentDateTime.year;
    return currentYear - birthYear;
  }

  Person({required this.name, required this.birthYear});
}

main() {
  // 연습문제 2
  final Map<String, int> personNames = {};
  final hong = Person(name: '홍길동', birthYear: 2005);
  final han = Person(name: '한석봉', birthYear: 2000);

  personNames[hong.name] = hong.age;
  personNames[han.name] = han.age;

  for (final entry in personNames.entries) {
    print('${entry.key}의 나이는 ${entry.value}살');
  }

  // 연습문제 3
  final List<Person> personList = [hong, han];
  for (final person in personList) {
    print(person.name);
  }
}
