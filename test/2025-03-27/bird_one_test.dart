import 'package:test/test.dart';

import '../../assignments/2025-03-27/bird_one.dart';

void main() {
  test('각각 소리 내거라', () async {
    List<Future<void>> birdFutures = [
      oneSecondBird(),
      twoSecondBird(),
      threeSecondBird(),
    ];

    await Future.wait(birdFutures);
  });
}
