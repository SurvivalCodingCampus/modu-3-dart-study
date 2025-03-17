// 연습 문제 2

Map<String, dynamic> gildong = {'name': '홍길동', 'age': 20};
Map<String, dynamic> seokbong = {'name': '한석봉', 'age': 25};

List<Map<String, dynamic>> person = [
  {'name': '홍길동', 'age': 20},
  {'name': '한석봉', 'age': 25},
];

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}

void main() {
  // Map 형태로 저장 후 값 출력하기
  print('${gildong['name']}의 나이는 ${gildong['age']}살');
  print('${seokbong['name']}의 나이는 ${seokbong['age']}살');

  // List Map 형태로 저장 후 값 출력하기
  print('${person[0]['name']}의 나이는 ${person[0]['age']}살');
  print('${person[1]['name']}의 나이는 ${person[1]['age']}살');

  // 객체를 List 에 저장해서 값 출력하기
  Person gildong1 = Person(name: '홍길동', age: 20);
  Person seokbong2 = Person(name: '한석봉', age: 25);

  List<Person> people = [];

  people.add(gildong1);
  people.add(seokbong2);

  print('${people[0].name}의 나이는 ${people[0].age}살');
  print('${people[1].name}의 나이는 ${people[1].age}살');
}
