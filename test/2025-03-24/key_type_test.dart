import '../../assignment/2025-03-24/index.dart';
import 'package:test/test.dart';

void main() {
  group('KeyType 테스트', () {
    test('Key Type 종류는 padlock, button, dial, finger이다', () {
      const types = KeyType.values;

      const correctTypes = [
        KeyType.padlock,
        KeyType.button,
        KeyType.dial,
        KeyType.finger,
      ];

      expect(types, correctTypes);
    });

    test(
      'Key Type의 각각 시도 횟수 한도는 padlock: 1_024, button: 10_000, dial: 30_000, finger: 1_000_000이다',
      () {
        const types = KeyType.values;
        final limitByTypes = types.map((e) => e.openCountLimit);

        const correctLimitByType = [1_024, 10_000, 30_000, 1_000_000];

        expect(limitByTypes, correctLimitByType);
      },
    );
  });
}
