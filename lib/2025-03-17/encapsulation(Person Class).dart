class Person {
  final String _name;
  final int _birthYear;

  Person({required this._name, required this._birthYear})

  String get name => _name;
  int get birthYear => _birthYear;

  int get age => DateTime.now().year - _birthYear;
  }