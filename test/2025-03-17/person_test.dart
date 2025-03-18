import 'package:modu_3_dart_study/2025-03-17/person.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  test('나이 계산은 올해년도에서 birthYear 년도를 뺀 값을 리턴한다', () {
    // 이름과 태어난 해는 수정 불가하도록 final 로 선언했으므로 생략
    const int birthYear = 2000;
    final Person person = Person(name: '홍길동', birthYear: birthYear);
    final now = DateTime.now();

    int age = person.age;

    expect(age, equals(now.year - birthYear));
  });
}

// 개인 프로젝트 투두리스트