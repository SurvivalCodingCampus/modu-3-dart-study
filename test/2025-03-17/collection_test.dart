import 'package:test/test.dart';

import '../../assignments/2025-03-17/person.dart';

void main() {
  test('컬렉셔 문제 1', () {
    const Map<String, int> personMap = {'홍길동': 20, '한석봉': 25};

    for (final String mapKey in personMap.keys) {
      print('$mapKey의 나이는 ${personMap[mapKey]}살');
    }
  });

  test('컬렉셔 문제 2', () {
    final List<Person> personList = [
      Person(name: '홍길동', birthYear: 2020),
      Person(name: '한석봉', birthYear: 2020),
    ];

    for (final Person person in personList) {
      print(person.name);
    }
  });
}
