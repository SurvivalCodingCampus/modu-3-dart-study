import 'package:test/test.dart';

import 'package:modu_3_dart_study/2025-03-27/index.dart';

void main() {
  group('Bird 테스트', () {
    Future<void> testBirdTweet(Bird bird, int delay) async {
      final stopwatch = Stopwatch()..start();
      const tweetCount = 1;

      await bird.tweet(tweetCount);
      final timerTime = stopwatch.elapsed.inSeconds;

      expect(timerTime, greaterThanOrEqualTo(delay));
    }

    test('Coo는 울 때 1초 이상 딜레이 되어야 한다.', () async {
      await testBirdTweet(Coo(), 1);
    });

    test('Caw는 울 때 2초 이상 딜레이 되어야 한다.', () async {
      await testBirdTweet(Caw(), 2);
    });

    test('Chirp는 울 때 3초 이상 딜레이 되어야 한다.', () async {
      await testBirdTweet(Chirp(), 3);
    });
  });
}
