import 'package:test/test.dart';

import '../../assignments/2025-03-27/solution3.dart';

void main() {
  // 예측되는 값을 여기서 미리 상수로 선언 할 수 있음
  group('Bird 10초 반복', () {
    final Bird bird1 = Bird(sound: '🐦‍꾸우', interval: 1);
    final Bird bird2 = Bird(sound: '🐤까악', interval: 2);
    final Bird bird3 = Bird(sound: '🐧짝짹', interval: 3); // 테스트마다 새롭게 생성

    test('Bird 생성자', () async {
      final String expectedSound = '🐦‍꾸우';
      final int expectedInterval = 1;

      bool flag = true;

      Future.delayed(Duration(seconds: 10), () {
        flag = false;
        print("🪟창문닫음!");
        // exit(0); // 강제종료,,,,
      });

      await Future.wait([
        bird1.makeSound(() => flag),
        bird2.makeSound(() => flag),
        bird3.makeSound(() => flag),
      ]);

      expect(bird1.sound, expectedSound);
      expect(bird1.interval, expectedInterval);
      expect(() async => await bird1.makeSound(() => flag), returnsNormally);
    });
  });
}
