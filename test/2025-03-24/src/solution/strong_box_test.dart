import 'package:modu_3_dart_study/assignments/2025-03-24/src/solution/strong_box.dart';
import 'package:test/test.dart';

void main() {
  group('StrongBox', () {
    const KeyType testKey = KeyType.padLock;
    const String testData = '금 한 돈';

    // given
    final strongBox = StrongBox(key: testKey);

    test('생성', () {
      // then
      expect(strongBox, isA<StrongBox>());
      expect(strongBox.key, testKey);
    });

    test('KeyType이 padLock인 경우', () {
      // when
      strongBox.put(testData);

      // then

      expect(strongBox.get(), null); // 1회 시도
      for (int i = 1; i < strongBox.key.maxCount; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), testData);
    });

    test('KeyType이 button인 경우', () {
      strongBox.key = KeyType.button;

      // when
      strongBox.put(testData);

      // then
      expect(strongBox.get(), null); // 1회 시도
      for (int i = 1; i < strongBox.key.maxCount; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), testData);
    });

    test('KeyType이 dial인 경우', () {
      strongBox.key = KeyType.dial;

      // when
      strongBox.put(testData);

      // then
      expect(strongBox.get(), null); // 1회 시도
      for (int i = 1; i < strongBox.key.maxCount; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), testData);
    });

    test('KeyType이 finger인 경우', () {
      strongBox.key = KeyType.finger;

      // when
      strongBox.put(testData);

      // then
      expect(strongBox.get(), null); // 1회 시도
      for (int i = 1; i < strongBox.key.maxCount; i++) {
        strongBox.get();
      }
      expect(strongBox.get(), testData);
    });
  });
}
