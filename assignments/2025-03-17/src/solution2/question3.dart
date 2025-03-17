/*
연습문제 2 에서 작성한 Person 클래스로 생성한 ‘홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
“홍길동의 나이는 20살”
“한석봉의 나이는 25살”
*/

import 'question2.dart';

void main() {
  List<Person> people = [Person(name: '홍길동'), Person(name: '한석봉')];
  Map<String, int> profile = {};
  for (final person in people) {
    Map<String, int> newValue = <String, int>{
      person.name: person.name == "홍길동" ? 20 : 25,
    };
    profile.addEntries(newValue.entries);
  }

  print(profile);

  // 명령형
  for (int i = 0; i < profile.length; i++) {
    print('${profile.keys.toList()[i]}의 나이는 ${profile.values.toList()[i]}살');
  }

  // 선언형
  profile.forEach((key, value) {
    print('$key의 나이는 $value살');
  });
}
