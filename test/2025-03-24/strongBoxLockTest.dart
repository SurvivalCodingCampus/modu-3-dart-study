import 'package:modu_3_dart_study/2025-03-24/strongBoxLock.dart';
import 'package:test/test.dart';

void main() {
  group("KeyType이 제대로 정의되었는지 확인", () {
    test("각 타입이 존재 하고 잘 전달 되는지 테스트", () {
      StrongBox<String> padLockBox = StrongBox(boxKeyType: KeyType.padlock);
      StrongBox<String> buttonBox = StrongBox(boxKeyType: KeyType.button);
      StrongBox<String> dialBox = StrongBox(boxKeyType: KeyType.dial);
      StrongBox<String> fingerBox = StrongBox(boxKeyType: KeyType.finger);

      expect(padLockBox.boxKeyType, KeyType.padlock);
      expect(buttonBox.boxKeyType, KeyType.button);
      expect(dialBox.boxKeyType, KeyType.dial);
      expect(fingerBox.boxKeyType, KeyType.finger);
    });
  });

  group("박스 잠금 테스트", () {
    test("padlock 테스트", () {
      StrongBox<String> padLockBox = StrongBox(boxKeyType: KeyType.padlock);
      padLockBox.put("Secret");
      const lockInt = 1024;
      for (int i = 0; i < lockInt; i++) {
        expect(padLockBox.get(), null);
      }

      if (padLockBox.padlockLock >= lockInt) {
        expect(padLockBox.get(), "Secret");
      }
    });

    test("button 테스트", () {
      StrongBox<String> buttonBox = StrongBox(boxKeyType: KeyType.button);
      buttonBox.put("Secret");
      const lockInt = 10000;

      for (int i = 0; i < lockInt; i++) {
        expect(buttonBox.get(), null);
      }

      if (buttonBox.padlockLock >= lockInt) {
        expect(buttonBox.get(), "Secret");
      }
    });

    test("dial 테스트", () {
      StrongBox<String> dialBox = StrongBox(boxKeyType: KeyType.dial);
      dialBox.put("Secret");
      const lockInt = 30000;

      for (int i = 0; i < lockInt; i++) {
        expect(dialBox.get(), null);
      }

      if (dialBox.padlockLock >= lockInt) {
        expect(dialBox.get(), "Secret");
      }
    });

    test("finger 테스트", () {
      StrongBox<String> fingerBox = StrongBox(boxKeyType: KeyType.finger);
      fingerBox.put("Secret");
      const lockInt = 1000000;

      for (int i = 0; i < lockInt; i++) {
        expect(fingerBox.get(), null);
      }

      if (fingerBox.padlockLock >= lockInt) {
        expect(fingerBox.get(), "Secret");
      }
    });
  });
}
