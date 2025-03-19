class Person {
  final String name;
  final DateTime birthYear;

  Person({required this.name, required this.birthYear});

  int get age => DateTime.now().year - birthYear.year;
}
