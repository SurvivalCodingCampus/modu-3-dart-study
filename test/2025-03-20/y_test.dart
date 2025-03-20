import 'package:test/test.dart';
import '../../assignments/2025-03-20/a.dart';
import '../../assignments/2025-03-20/b.dart';
import '../../assignments/2025-03-20/y.dart';

void main() {
  test('Y, B 메서드 호출 테스트', () {
    List<Y> list = [A(), B()];

    for (final y in list) {
      y.b();
      expect(y, isA<Y>());
    }
  });
}
