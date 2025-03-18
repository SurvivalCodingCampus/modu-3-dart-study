class Person {
  List<Map<String, dynamic>> students = [
    {'name': '홍길동'},
    {'name': '한석봉'},
  ];

  void printStudent() {
    for (var student in students) {
      // print(student);
      print('${student['name']}');
    }
  }
}

void main() {
  Person person = Person();
  person.printStudent();
}