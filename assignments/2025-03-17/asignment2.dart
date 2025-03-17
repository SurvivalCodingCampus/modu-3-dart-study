class Person {
  final String name;
  final int birthYear;
  final int _age;

  Person({required this.name, required this.birthYear})
    : _age = DateTime.now().year - birthYear;

  int get age => _age;
}

void main(List<String> args) {

  Person person = Person(name: '홍길동', birthYear: 2020);
  print(person.age);

  Map<String, int> peopleMap = {'홍길동': 20, '한석봉': 25};

  for (final element in peopleMap.entries) {
    print('${element.key}의 나이는 ${element.value}살');
  }

  // ‘홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
  // 그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
  // “홍길동의 나이는 20살”
  // “한석봉의 나이는 25살”

  Person gildong = Person(name: '홍길동', birthYear: 2000);
  Person seokbong = Person(name: '한석봉', birthYear: 1000);
  List<Person> peopleList = [gildong, seokbong];
  for (final person in peopleList) {
    print(person.name);
  }

  // 이름을 가지는 Person 클래스를 작성하고, 다음을 수행하는 코드를 작성하시오.
  // 이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
  // List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
}