import 'dart:async';

import 'package:modu_3_dart_study/2025-03/2025-03-27/bird.dart';

import 'package:test/test.dart';

void main() {
  test('2. tweet() 함수는 모두 4번씩만 출력된 후 완료되어야 한다.', () async {
    final Bird birdOne = Bird(name: '새 1', delay: 1, sound: "꾸우");
    final Bird birdTwo = Bird(name: '새 2', delay: 2, sound: "까악");
    final Bird birdThree = Bird(name: '새 3', delay: 3, sound: "짹짹");

    List<String> expected = [];

    while (birdOne.count < 4) {
      expected.add(await birdOne.tweet());
      expected.add(await birdTwo.tweet());
      expected.add(await birdThree.tweet());
    }

    expect(expected.length, equals(12));
    expect(birdOne.count, equals(4));
    expect(birdTwo.count, equals(4));
    expect(birdThree.count, equals(4));
  });

  test('3. 각 새는 10초동안 무기한으로 지저귈 수 있다.', () async {
    final Bird birdOne = Bird(name: '새 1', delay: 1, sound: "꾸우");
    final Bird birdTwo = Bird(name: '새 2', delay: 2, sound: "까악");
    final Bird birdThree = Bird(name: '새 3', delay: 3, sound: "짹짹");

    Timer one = await birdOne.repeat();
    Timer two = await birdTwo.repeat();
    Timer three = await birdThree.repeat();

    await Future.delayed(const Duration(seconds: 11), () {
      one.cancel();
      two.cancel();
      three.cancel();
    });

    expect(birdOne.count, 10);
    expect(birdTwo.count, 5);
    expect(birdThree.count, 3);
  });
}
