import 'package:test/test.dart';
import '../../assignments/2025-03-24/strongbox.dart';

void main() {
  group("StrongBox 테스트", () {
    test("금고에 아이템을 넣고 횟수가 부족하면 null 반환", () {
      StrongBox<String> box = StrongBox<String>(KeyType.padlock);
      box.put("비밀문서");

      for (int i = 0; i < 1023; i++) {
        expect(box.get(), isNull, reason: "1024번 이하에서는 null이어야 함");  // reason 사용해보기
      }
    });

    test("금고에서 올바르게 값을 반환해야 함", () {
      StrongBox<String> box = StrongBox<String>(KeyType.padlock);
      box.put("비밀문서");

      for (int i = 0; i < 1023; i++) {
        box.get(); // 잠금 해제까지 시도
      }

      expect(box.get(), equals("비밀문서"), reason: "1024번째 시도에서는 값이 반환되어야 함");
    });

    test("각 열쇠 타입별 unlock 횟수 테스트", () {
      Map<KeyType, int> expectedAttempts = {
        KeyType.padlock: 1024,
        KeyType.button: 10000,
        KeyType.dial: 30000,
        KeyType.finger: 1000000,
      };

      for (var key in KeyType.values) {
        StrongBox<int> box = StrongBox<int>(key);
        box.put(1234);

        for (int i = 0; i < expectedAttempts[key]! - 1; i++) {
          expect(box.get(), isNull, reason: "${expectedAttempts[key]}번 이하에서는 null이어야 함");
        }

        expect(box.get(), equals(1234), reason: "${expectedAttempts[key]}번째 시도에서 값이 반환되어야 함");
      }
    });

    test("금고에 null을 저장할 경우", () {
      StrongBox<String?> box = StrongBox<String?>(KeyType.padlock);
      box.put(null);

      for (int i = 0; i < 1023; i++) {
        expect(box.get(), isNull, reason: "null을 저장했어도 unlock 횟수 전에는 null이어야 함");
      }

      expect(box.get(), isNull, reason: "unlock 후에도 저장된 값이 null이면 null이어야 함");
    });
  });
}