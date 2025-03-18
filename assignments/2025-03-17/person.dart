class Person {
  final String name;
  final int birthYear;

  Person({required this.name, required this.birthYear});

  // 현재 연도를 이용하여 나이 계산 (수정 불가능한 프로퍼티)
  int get age => DateTime.now().year - birthYear;
}