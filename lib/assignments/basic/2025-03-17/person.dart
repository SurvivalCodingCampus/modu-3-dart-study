class Person {
  final String name;
  final int year;

  Person({required this.name, required this.year});

  // 나이 계산
  int get age {
    final today = DateTime.now().year;
    final personAge = today - year;
    return personAge;
  }
}
