import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-27/bird1.dart';

void main() {
  group('birdtest', () {
    test('birdtest1', () async {
      Stopwatch stopwatch = Stopwatch()..start();
      await birdSound1();
      expect(stopwatch.elapsed.inSeconds, equals(4));
    });

    test('birdtest2', () async {
      Stopwatch stopwatch = Stopwatch()..start();
      await birdSound2();
      expect(stopwatch.elapsed.inSeconds, equals(8));
    });
    test('birdtest3', () async {
      Stopwatch stopwatch = Stopwatch()..start();
      await birdSound3();
      expect(stopwatch.elapsed.inSeconds, equals(12));
    });
    test('birdwait', () async {
      Stopwatch stopwatch = Stopwatch()..start();
      await printBird();
      expect(stopwatch.elapsed.inSeconds, equals(12));
    });
  });
}
