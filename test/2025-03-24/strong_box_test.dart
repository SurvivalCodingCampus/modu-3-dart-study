
import 'package:modu_3_dart_study/2025-03-24/strong_box.dart';
import 'package:test/test.dart';

void main() {
  // 테스트용 아이템 정의
  const String moneyItem = '비상금';
  const int bitCoinItem = 100000000000;
  const double myFatAmount = 10.5;
  const bool amIRichMan = true;

  group('StrongBox - KeyType 테스트', () {
    test(
        'padlock 키로 String 타입 아이템을 1024번까지 접근할 수 있고, 1025번부터는 null을 반환한다.', () {
      StrongBox<String> box = StrongBox(KeyType.padlock);
      box.put(moneyItem);

      // maxAttempts 값이 1024로 예상됨
      final maxAttempts = KeyType.padlock.maxAttempts;

      // 먼저 모든 아이템을 get()으로 꺼냄
      for (int i = 0; i < maxAttempts; i++) {
        box.get();
      }

      // 1024번까지는 값이 있어야 하고, 1025번부터는 null을 반환해야 한다.
      final result = box.get();
      expect(result, isNull); // 1025번 이후는 null 반환
    });

    test('button 키로 int 타입 아이템을 10000번까지 접근할 수 있고, 10001번부터는 null을 반환한다.', () {
      StrongBox<int> box = StrongBox(KeyType.button);
      box.put(bitCoinItem);

      // maxAttempts 값이 10000으로 예상됨
      final maxAttempts = KeyType.button.maxAttempts;

      // 먼저 모든 아이템을 get()으로 꺼냄
      for (int i = 0; i < maxAttempts; i++) {
        box.get();
      }

      // 10000번까지는 값이 있어야 하고, 10001번부터는 null을 반환해야 한다.
      final result = box.get();
      expect(result, isNull); // 10001번 이후는 null 반환
    });

    test('dial 키로 double 타입 아이템을 30000번까지 접근할 수 있고, 30001번부터는 null을 반환한다.', () {
      StrongBox<double> box = StrongBox(KeyType.dial);
      box.put(myFatAmount);

      // maxAttempts 값이 30000으로 예상됨
      final maxAttempts = KeyType.dial.maxAttempts;

      // 먼저 모든 아이템을 get()으로 꺼냄
      for (int i = 0; i < maxAttempts; i++) {
        box.get();
      }

      // 30000번까지는 값이 있어야 하고, 30001번부터는 null을 반환해야 한다.
      final result = box.get();
      expect(result, isNull); // 30001번 이후는 null 반환
    });

    test(
        'finger 키로 bool 타입 아이템을 1000000번까지 접근할 수 있고, 1000001번부터는 null을 반환한다.', () {
      StrongBox<bool> box = StrongBox(KeyType.finger);
      box.put(amIRichMan);

      // maxAttempts 값이 1000000으로 예상됨
      final maxAttempts = KeyType.finger.maxAttempts;

      // 먼저 모든 아이템을 get()으로 꺼냄
      for (int i = 0; i < maxAttempts; i++) {
        box.get();
      }

      // 1000000번까지는 값이 있어야 하고, 1000001번부터는 null을 반환해야 한다.
      final result = box.get();
      expect(result, isNull); // 1000001번 이후는 null 반환
    });
  });
}
