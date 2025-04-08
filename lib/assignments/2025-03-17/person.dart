class Person {
  final String name;
  final int? birthYear;

  final int currentYear = DateTime.now().year;

  Person({required this.name, this.birthYear});

  int? get age {
    if (birthYear == null) {
      return null;
    }
    return currentYear - birthYear!;
  }
}
