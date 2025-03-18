import 'package:modu_3_dart_study/2025-03-17/collection_2.dart';
import 'package:test/test.dart';

void main() {
  test('홍길동, 한석봉, 나이 20,25, 이름과 나이 컬렉션', (){
    Person people = Person();
    expect(people.gilDong['name'], equals('홍길동'));
    expect(people.gilDong['age'], equals('20살'));
    expect(people.seokBong['name'], equals('한석봉'));
    expect(people.seokBong['age'], equals('25살'));
  });
}