import 'package:test/test.dart';

import '../../../assignments/2025-03/2025-03-24/strong_box.dart';

void main() {
  group('strongBox', () {
    test('put, get method 테스트', () {
      StrongBox<String> strongBox1 = StrongBox(
        instance: 'string',
        keyType: KeyType.padlock,
      );
      for (int i = 0; i < 1024; i++) {
        expect(strongBox1.get() == null, isTrue);
      }
      expect(strongBox1.get() == 'string', isTrue);
      strongBox1.put('new string');
      expect(strongBox1.get() == 'new string', isTrue);
    });

    test('keyType 테스트', () {
      int content = 123;
      const int unlockPadlock = 1024;
      const int unlockButton = 10000 ;
      const int unlockDial = 30000;
      const int unlockFinger = 1000000;

      StrongBox<int> strongBoxPadlock = StrongBox(
        instance: content,
        keyType: KeyType.padlock,
      );
      StrongBox<int> strongBoxButton = StrongBox(
        instance: content,
        keyType: KeyType.button,
      );
      StrongBox<int> strongBoxDial = StrongBox(
        instance: content,
        keyType: KeyType.dial,
      );
      StrongBox<int> strongBoxFinger = StrongBox(
        instance: content,
        keyType: KeyType.finger,
      );

      for (int i = 0; i < unlockPadlock; i++) {
        expect(strongBoxPadlock.get() == null, isTrue);
      }
      expect(strongBoxPadlock.get() == content, isTrue);

      for (int i = 0; i < unlockButton; i++) {
        expect(strongBoxButton.get() == null, isTrue);
      }
      expect(strongBoxButton.get() == content, isTrue);

      for (int i = 0; i < unlockDial; i++) {
        expect(strongBoxDial.get() == null, isTrue);
      }
      expect(strongBoxDial.get() == content, isTrue);

      for (int i = 0; i < unlockFinger; i++) {
        expect(strongBoxFinger.get() == null, isTrue);
      }
      expect(strongBoxFinger.get() == content, isTrue);
    });
  });
}
