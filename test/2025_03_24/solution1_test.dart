import 'package:test/test.dart';

import '../../assignments/2025_03_24/enum/key_type.dart';
import '../../assignments/2025_03_24/generic/strong_box.dart';

void main() {
  final padLockKey = 1024;
  final buttonKey = 10000;
  final dialKey = 30000;
  final fingerKey = 1000000;
  group('Strong Box', () {
    test('Strong Box class 정의', () {
      StrongBox strongBox = StrongBox(element: '', key: KeyType.padLock);
      expect(strongBox, isA());
    });
    test('KeyType 열거형 정의', () {
      StrongBox strongBox1 = StrongBox(element: '', key: KeyType.padLock);
      StrongBox strongBox2 = StrongBox(element: '', key: KeyType.button);
      StrongBox strongBox3 = StrongBox(element: '', key: KeyType.dial);
      StrongBox strongBox4 = StrongBox(element: '', key: KeyType.finger);

      expect(strongBox1.key, KeyType.padLock);
      expect(strongBox1.getKeyTypeInt(), padLockKey);

      expect(strongBox2.key, KeyType.button);
      expect(strongBox2.getKeyTypeInt(), buttonKey);

      expect(strongBox3.key, KeyType.dial);
      expect(strongBox3.getKeyTypeInt(), dialKey);

      expect(strongBox4.key, KeyType.finger);
      expect(strongBox4.getKeyTypeInt(), fingerKey);
    });
    test('StrongBox get()', () {
      StrongBox strongBox = StrongBox(element: '', key: KeyType.padLock);

      strongBox.get();

      expect(strongBox.keyTypeCount, 1);
    });
  });
}
