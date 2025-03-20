import 'package:test/test.dart';

import '../../assignments/2025-03-20/a.dart';
import '../../assignments/2025-03-20/b.dart';
import '../../assignments/2025-03-20/y.dart';

void main() {
  group('List : ', () {
    test('A B 리스트 생성', () {
      // given
      final List<Y> yList = [A(), B()];

      // when
      for (final Y y in yList) {
        y.b();
      }
    });
  });
}
