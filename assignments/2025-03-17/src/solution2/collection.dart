import 'package:modu_3_dart_study/2025-03-17/person.dart';

void main() {
  // 이름과 나이를 쌍으로 적당한 컬렉션에 넣기
  Map<String, int> ageCollection = {
    '홍길동' : 20,
    '한석봉' : 25
  };

  print('홍길동의 나이는 ${ageCollection['홍길동']}살');
  print('한석봉의 나이는 ${ageCollection['한석봉']}살');

  //  ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담기
  List<Person> person = [
    Person(name: '홍길동', birthYear: 20),
    Person(name: '한석봉', birthYear: 25)
  ];

  // List에 담긴 모든 Person 인스턴스의 이름을 표시하기
  for (final i in person) {
    print(i.name);
  }
}