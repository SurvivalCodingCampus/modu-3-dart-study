class Person {
  final String name;
  final int birthYear;

  // 나이 제공 age 프로퍼티
  int get age {
    final now = DateTime.now();
    return now.year - birthYear;
  }

  Person({required this.name, required this.birthYear});
}
