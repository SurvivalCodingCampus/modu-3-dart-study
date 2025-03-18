class Person {
  final String _name;
  final int _birthYear;
  int _age = 0;    //필요없음.

  Person({required String name, required int birthYear}): _name = name, _birthYear = birthYear {
    _age = this._calculateAge(birthYear);
    //print('나이는 ${this.age} 입니다.');
  }

  //getter 정의
  String get name => _name;
  int get birthYear => _birthYear;
  int get age => _age;

  // 나이 계산.
  int _calculateAge(int birthYear) {
    //올해 나이를 계산
    return DateTime.now().year - birthYear;
  }
}
