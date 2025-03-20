import 'package:test/test.dart';

import '../../assignments/2025-03-20/a.dart';

void main() {
  group('A : ', () {
    test('완벽한 생성', () {
      // given
      A a = A();

      // then
      expect(a, isA<A>());
    });
  });
}
