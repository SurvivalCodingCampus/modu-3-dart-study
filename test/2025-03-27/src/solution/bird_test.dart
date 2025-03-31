import 'package:test/test.dart';

import '../../../../assignments/2025-03-27/src/solution/bird.dart';

void main() {
  final bird1 = Bird1('새1', "꾸우");
  final bird2 = Bird2('새2', "까악");
  final bird3 = Bird3('새3', "짹짹");
  group('Bird', () {
    test('생성', () {
      // 추상 클래스 Bird를 상속받는지 테스트
      expect(bird1, isA<Bird>());
      expect(bird2, isA<Bird>());
      expect(bird3, isA<Bird>());
      expect(bird1.sound, equals("꾸우"));
      expect(bird2.sound, equals("까악"));
      expect(bird3.sound, equals("짹짹"));
    });
  });

  test('새소리 횟수 테스트', () async {
    await Future.wait([
      bird1.makeSound(),
      bird2.makeSound(),
      bird3.makeSound(),
    ]);

    expect(bird1.sounds, equals(["꾸우", "꾸우", "꾸우", "꾸우"]));
    expect(bird2.sounds, equals(["까악", "까악", "까악", "까악"]));
    expect(bird3.sounds, equals(["짹짹", "짹짹", "짹짹", "짹짹"]));
  });
}
