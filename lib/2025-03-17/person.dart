class Person {
  late String _name;
  late int _birthYear;
  late int _age;

  String get name => _name;

  int get birthYear => _birthYear;

  int get age => _age;

  set calYearAge(int birthYear) {
    _age = DateTime.now().year - birthYear;
    print("$name 님의 연 나이는 $age세 입니다");
  }

  Person({required String name, required int birthYear}) {
    _name = name;
    _birthYear = birthYear;
    calYearAge = birthYear;
  }
}
