import 'package:test/test.dart';

import '../../../lib/assignments/2025-03-/2025-03-24/key_type.dart';
import '../../../lib/assignments/2025-03-/2025-03-24/strong_box.dart';

void main() {
  final intInitialValue = 1;
  final intAfterValue = 2;
  final stringInitialValue = '1번';
  final stringAfterValue = '2번';
  final doubleInitialValue = 1.1;
  final doubleAfterValue = 2.2;
  final listIntInitialValue = [1, 2];
  final listIntAfterValue = [1, 2, 3];
  final strongBox1 = StrongBox<int>(intInitialValue, keyType: KeyType.padlock);
  final strongBox2 = StrongBox<String>(
    stringInitialValue,
    keyType: KeyType.button,
  );
  final strongBox3 = StrongBox<double>(
    doubleInitialValue,
    keyType: KeyType.dial,
  );
  final strongBox4 = StrongBox<List<int>>(
    listIntInitialValue,
    keyType: KeyType.finger,
  );
  group("금고 test", () {
    test("count 값 테스트", () {
      expect(strongBox1.count, equals(strongBox1.keyType.maxCount));
      expect(strongBox2.count, equals(strongBox2.keyType.maxCount));
      expect(strongBox3.count, equals(strongBox3.keyType.maxCount));
      expect(strongBox4.count, equals(strongBox4.keyType.maxCount));
    });

    test("int type get/put & padlock 함수 테스트", () {
      for (int i = 1; i < strongBox1.keyType.maxCount; i++) {
        strongBox1.get;
      }
      expect(strongBox1.get, null);
      expect(strongBox1.get, intInitialValue);

      strongBox1.put = intAfterValue;

      expect(strongBox1.get, intAfterValue);
    });

    test("int type get/put & button 함수 테스트", () {
      for (int i = 1; i < strongBox2.keyType.maxCount; i++) {
        strongBox2.get;
      }

      expect(strongBox2.get, null);
      expect(strongBox2.get, stringInitialValue);

      strongBox2.put = stringAfterValue;

      expect(strongBox2.get, stringAfterValue);
    });

    test("double type get/put & dial 함수 테스트", () {
      for (int i = 1; i < strongBox3.keyType.maxCount; i++) {
        strongBox3.get;
      }

      expect(strongBox3.get, null);
      expect(strongBox3.get, doubleInitialValue);

      strongBox3.put = doubleAfterValue;

      expect(strongBox3.get, doubleAfterValue);
    });

    test("List<int> type get/put & finger 함수 테스트", () {
      for (int i = 1; i < strongBox4.keyType.maxCount; i++) {
        strongBox4.get;
      }

      expect(strongBox4.get, null);
      expect(strongBox4.get, listIntInitialValue);

      strongBox4.put = listIntAfterValue;

      expect(strongBox4.get, listIntAfterValue);
    });
  });
}
