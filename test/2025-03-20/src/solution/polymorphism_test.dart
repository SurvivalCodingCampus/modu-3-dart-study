import 'package:modu_3_dart_study/assignments/2025-03-20/src/solution/a.dart';
import 'package:modu_3_dart_study/assignments/2025-03-20/src/solution/b.dart';
import 'package:modu_3_dart_study/assignments/2025-03-20/src/solution/x.dart';
import 'package:modu_3_dart_study/assignments/2025-03-20/src/solution/y.dart';
import 'package:test/test.dart';

void main() {
  test('A 생성 테스트', () {
    // given
    A a = A();

    // then
    expect(a, isA<A>());
    expect(a, isA<Y>());
    expect(a, isA<X>());
  });
  test('B 생성 테스트', () {
    // given
    B b = B();

    // then
    expect(b, isA<B>());
    expect(b, isA<Y>());
    expect(b, isA<X>());
  });
}
