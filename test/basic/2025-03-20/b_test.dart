import 'package:test/test.dart';
import '../../../assignments/basic/2025-03-20/b.dart';
import '../../../assignments/basic/2025-03-20/y.dart';

void main() {
  test('Y, B 메서드 호출 테스트', () {
    Y y2 = B();

    y2.a();

    expect(y2, isA<B>());
    expect(y2, isA<Y>());
  });
}
