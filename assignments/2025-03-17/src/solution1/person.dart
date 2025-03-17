class Person {
  final String _name;
  final int _birthYear;
  /*final*/ int _age;

  Person({required String name, required int birthYear})
      :
        _name = name,
        _birthYear = birthYear, _age = _resultAge(birthYear);


  //------- Name getter
  String get name => _name;


  //------- BirthYear getter
  int get birthYear => _birthYear;

  //------- Age getter
  int get age => _age;


  // 연도 계산 함수
  static int _resultAge(int birthYear, {int? currentYear}) {
    // 주어진 현재 연도에서 태어난 해를 빼서 나이를 계산
    return (currentYear ?? 2025) - birthYear;   // currentYear가 null이면 2025년으로 계산
  }

}
