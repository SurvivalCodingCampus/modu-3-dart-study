class Person {
  final Map<String, dynamic> gilDong = {'name': '홍길동', 'age': '20살'};
  final Map<String, dynamic> seokBong = {'name': '한석봉', 'age': '25살'};

  void printStudent() {
    print('${gilDong['name']}의 나이는 ${gilDong['age']}');
    print('${seokBong['name']}의 나이는 ${seokBong['age']}');
  }
}

void main() {
  Person person = Person();
  person.printStudent();
}