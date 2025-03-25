import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-24/strongboxkeytype.dart';

void main() {
  group('StrongBox test', () {
    test('시도횟수가 적었을 때', () {
      final strongbox = StrongBox<String>(keyType: KeyType.padlock);
      strongbox.put('key');

      int testCount = 1023;

      for (int i = 1; i <= testCount; i++) {
        String? result = strongbox.get();
        if (i == testCount) {
          expect(result, isNull);
        }
      }
    });

    test(' 잠금해제 ', () {
      final strongbox = StrongBox<String>(keyType: KeyType.padlock);
      strongbox.put('key');

      int testCount = strongbox.maxKeyCount();

      for (int i = 1; i <= testCount; i++) {
        String? result = strongbox.get();
        if (i == testCount) {
          expect(result, equals('key'));
        }
      }
    });
  });
}
