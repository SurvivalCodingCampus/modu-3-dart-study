class Person {
  //private로 변수 선언
  String _name;
  int _birthYear;

  //getter를 사용해 외부에서도 쓸 수 있게함
  String get name => _name;

  int get birthYear => _birthYear;
  final now = DateTime.now().year;

  Person({required String name, required int birthYear})
    : _name = name,
      _birthYear = birthYear;

  //나이는 바뀌지 않음으로 getter로 생성
  int get age => now - birthYear;
}
