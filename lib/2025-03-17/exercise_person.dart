class Person {
  final String _name;
  final int _age;
  DateTime birthYear;

  Person(this._name, this._age, this.birthYear);

  String get name => _name;

  int get age => _age;

  int ageYear() {
    int currentYear = DateTime.now().year;
    return currentYear - birthYear.year;
  }
}
