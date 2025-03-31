import 'package:test/test.dart';

import '../../assignment/2025-03-27/index.dart';

void main() {
  group('Grassland 테스트', () {
    test('Coo, Caw, Chirp이 함께 4번 울 때 12초 이상 딜레이 되어야 한다.', () async {
      final stopwatch = Stopwatch()..start();
      const delay = 12;
      final grassland = Grassland(birds: [Coo(), Caw(), Chirp()]);

      await grassland.tweetTogether(count: 4);
      final timerTime = stopwatch.elapsed.inSeconds;

      expect(timerTime, greaterThanOrEqualTo(delay));
    });
  });
}
