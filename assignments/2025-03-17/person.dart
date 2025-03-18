class Person {
  final String _name;
  final int _birthYear;

  Person(this._name, this._birthYear);

  String get name => _name;

  int get age {
    final now = DateTime.now().year;
    return now - _birthYear;
  }

  int get birth => _birthYear;
}

void main(){
  //2
  Map<String, int> data = {
    '홍길동' : 20,
    '한석봉' : 25,
  };

  data.entries.forEach( (data) {
    print("${data.key}의 나이는 ${data.value}살");
  });

  //3
  //이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
  //List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.

  List<Person> persons = [
    Person('홍길동', 20),
    Person('한석봉', 25),
  ];

  persons.forEach( (data) {
    print(data.name);
  });
}