import 'package:test/test.dart';

import 'package:modu_3_dart_study/assignments/2025-03-27/solution2.dart';

void main() {
  // 예측되는 값을 여기서 미리 상수로 선언 할 수 있음
  group('Bird 클래스 테스트', () {
    final Bird bird1 = Bird(sound: '🐦‍꾸우', interval: 1);
    final Bird bird2 = Bird(sound: '🐤까악', interval: 2);
    final Bird bird3 = Bird(sound: '🐧짝짹', interval: 3); // 테스트마다 새롭게 생성

    test('makeSound 비동기 테스트', () async {
      final String expectedSound = '🐦‍꾸우';
      final int expectedInterval = 1;

      expect(bird1.sound, expectedSound);
      expect(bird1.interval, expectedInterval);
      expect(() async => await bird1.makeSound(1), returnsNormally);
    });

    test('makeSound 4번', () async {
      await Future.wait([
        bird1.makeSound(4),
        bird2.makeSound(4),
        bird3.makeSound(4),
      ]);
      expect(() async => await bird1.makeSound(4), returnsNormally);
    });
  });
}
