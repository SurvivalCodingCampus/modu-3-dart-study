import 'dart:async';

import 'package:test/test.dart';

import '../../assignments/2025-03-27/bird_two.dart';

void main() async {
  test('10초동안 울어라', () async {
    bool running = true;

    oneSecondBirdDuring(() => running);
    twoSecondBirdDuring(() => running);
    threeSecondBirdDuring(() => running);

    // List<Future<void>> birdFutures = [
    //   oneSecondBirdDuring(() => running),
    //   twoSecondBirdDuring(() => running),
    //   threeSecondBirdDuring(() => running),
    // ];

    await Future.delayed(Duration(seconds: 10), () => running = false);

    // await Future.wait(birdFutures);
  });
}
