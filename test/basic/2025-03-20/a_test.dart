import 'package:test/test.dart';

import '../../../assignments/basic/2025-03-20/a.dart';
import '../../../assignments/basic/2025-03-20/x.dart';
import '../../../assignments/basic/2025-03-20/y.dart';

void main() {
  group("A 와 X 테스트", () {
    test('X, A 메서드 호출 테스트', () {
      X obj = A();

      obj.a();

      expect(obj, isA<A>());
      expect(obj, isA<X>());
    });

    test('Y, A 메서드 호출 테스트', () {
      Y y1 = A();

      y1.a();

      expect(y1, isA<A>());
      expect(y1, isA<Y>());
    });
  });
}
