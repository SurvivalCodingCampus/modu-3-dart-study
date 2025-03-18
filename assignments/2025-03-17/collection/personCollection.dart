//캡슐화 적용
class Person {
  String _name = '';

  //constructor
  Person(String name) : _name = name;

  //_name getter
  String get name => _name;
}

void main() {
  List<Person> personList = [Person('문성용'), Person('홍길동'), Person('한석봉')];

  //1. iterator 활용
  final iterator = personList.iterator;

  while (iterator.moveNext()) {
    print(iterator.current.name);
  }

  //2. index를 활용
  for (int i = 0; i < personList.length; i++) {
    print (personList[i].name);
  }

  //3. 무지성 뺑뺑이
  for (final person in personList) {
    print(person.name);
  }

  //4. 사용금지 테스트
  personList.forEach((person) {
    print(person.name);
  });

  //5. 함수의 입력과 출력이 동일한 경우
  personList.forEach(print);   //출력 Instance of 'Person'
}
