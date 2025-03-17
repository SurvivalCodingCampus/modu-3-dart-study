class Person {
  late String _name;
  late int _birthYear;
  late int _age;

  String get name => _name;

  int get birthYear => _birthYear;

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  void calculateAge() {
    _age = DateTime.now().year - birthYear;
  }

  Person({required String name, required int birthYear}) {
    _name = name;
    _birthYear = birthYear;
    {
      calculateAge();
    }
    // calYearAge = birthYear;
  }
}
