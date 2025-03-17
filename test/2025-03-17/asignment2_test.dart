import 'package:test/test.dart';

import '../../assignments/2025-03-17/asignment2.dart';

void main() {
  test('컬렉션 응용 테스트', () {
    // ‘홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
    // 그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
    // “홍길동의 나이는 20살”
    // “한석봉의 나이는 25살”

    //given
    Map<String, int> asignment1 = {'홍길동': 20, '한석봉': 25};

    //when, then
    for (final element in asignment1.entries) {
      print('${element.key}의 나이는 ${element.value}살');
    }
  });
  test('description', () {
    // 이름을 가지는 Person 클래스를 작성하고, 다음을 수행하는 코드를 작성하시오.
    // 이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
    // List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.

    //given
    Person gildong = Person(name: '홍길동', birthYear: 2005);
    Person seokbong = Person(name: '한석봉', birthYear: 2005);
    List<Person> people = [gildong, seokbong];

    //when, then
    for (final person in people) {
      print(person.name);
    }
  });
}
