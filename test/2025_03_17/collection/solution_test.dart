import 'package:test/test.dart';

import '../../../assignments/2025_03_17/collection/solution.dart';

void main() {
  test('Collection 사용해서 값 출력하기', () {
    Map<String, dynamic> gildong = {'name': '홍길동', 'age': 20};
    Map<String, dynamic> seokbong = {'name': '한석봉', 'age': 25};

    print('${gildong['name']}의 나이는 ${gildong['age']}살');
    print('${seokbong['name']}의 나이는 ${seokbong['age']}살');
  });

  test('Class 와 Collection 사용해서 값 출력하기', () {
    Person gildong = Person(name: '홍길동', age: 20);
    Person seokbong = Person(name: '한석봉', age: 25);

    List<Person> people = [];

    people.add(gildong);
    people.add(seokbong);

    for (int i = 0; i < people.length; i++) {
      print(people[i].name);
    }
  });
}
