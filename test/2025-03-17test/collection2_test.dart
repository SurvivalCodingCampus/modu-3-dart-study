import 'package:modu_3_dart_study/PR2025-03-17/collection2.dart';
import 'package:test/expect.dart';
import 'package:test/test.dart';

void main() {
  group('MapTest', () {
    test('갯수확인 Test', () {
      //given(준비)
      //when(실행)
      for (int i = 0; i < student.length; i++) {
        print('${student[i].values.first}의 나이는 ${student[i].values.last}살');
      }
      //then(검증)
      expect(student.length, equals(2));
    });
    test('홍길동 Test', () {
      //given(준비)
      //when(실행)
      //then(검증)
      expect(student[0].values.first, equals("홍길동"));
    });
    test('한석봉 Test', () {
      //given(준비)
      //when(실행)
      //then(검증)
      expect(student[1].values.first, equals("힌석봉"));
    });
  });
}
