// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  final String _name;
  final int _birthYear;

  Person({required String name, required int birthYear})
    : _name = name,
      _birthYear = birthYear;

  String get name => _name;

  int get age => DateTime.now().year - _birthYear;
}
