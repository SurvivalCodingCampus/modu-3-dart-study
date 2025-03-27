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
      expect(strongBox, isA<StrongBox>());
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
    test('StrongBox get() count 증가', () {
      StrongBox strongBox = StrongBox(element: '', key: KeyType.padLock);
      int keycount = strongBox.keyTypeCount;
      print(keycount);

      strongBox.get();
      expect(keycount + 1, strongBox.keyTypeCount);
    });

    group('keyLock test', () {
      test('padLock test', () {
        StrongBox strongBox1 = StrongBox(element: '과자', key: KeyType.padLock);
        strongBox1.keyTypeCount = 1023;
        strongBox1.get();

        expect(strongBox1.element, strongBox1.get());
      });
      test('buttonLock test', () {
        StrongBox strongBox2 = StrongBox(element: '과자', key: KeyType.button);
        strongBox2.keyTypeCount = 9999;
        strongBox2.get();

        expect(strongBox2.element, strongBox2.get());
      });
      test('dialLock test', () {
        StrongBox strongBox3 = StrongBox(element: '과자', key: KeyType.dial);
        strongBox3.keyTypeCount = 29999;
        strongBox3.get();

        expect(strongBox3.element, strongBox3.get());
      });
      test('fingerLock test', () {
        StrongBox strongBox4 = StrongBox(element: '과자', key: KeyType.finger);
        strongBox4.keyTypeCount = 999999;
        strongBox4.get();

        expect(strongBox4.element, strongBox4.get());
      });
    });
  });
}
