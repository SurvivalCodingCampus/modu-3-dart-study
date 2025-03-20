import 'package:test/test.dart';

import '../../assignments/2025-03-20/b.dart';

void main() {
  group('B : ', () {
    test('완벽한 생성', () {
      // given
      B b = B();

      // then
      expect(b, isA<B>());
    });
  });
}
