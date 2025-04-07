abstract class Bird {
  Future<void> tweet();
}

class Coo extends Bird {
  @override
  Future<void> tweet() async {
    print('🕊️꾸우~');
    await Future.delayed(Duration(seconds: 1));
  }
}

class Caw extends Bird {
  @override
  Future<void> tweet() async {
    print('🐦‍⬛까악~');
    await Future.delayed(Duration(seconds: 2));
  }
}

class Chirp extends Bird {
  @override
  Future<void> tweet() async {
    print('🦜짹짹~');
    await Future.delayed(Duration(seconds: 3));
  }
}

class Grassland {
  final List<Bird> birds;

  const Grassland({required this.birds});

  Future<void> tweetFourth() async {
    final futures = birds.map((bird) async {
      for (int i = 0; i < 4; i++) {
        await bird.tweet();
      }
    }).toList();

    print(futures.length);

    await Future.wait(futures);
  }

// Future<void> tweetForever() async {
// final futures = birds.map((bird) async {
// while (true) {
// await bird.tweet();
// }
// }).toList();
//
// await Future.wait(futures);
// }
}

main() async {
  final s = Stopwatch()..start();
  final g = Grassland(birds: [Coo(), Caw(), Chirp()]);
  await g.tweetFourth();
  print('${s.elapsed.inSeconds}초');
}























import 'dart:async';
import 'dart:io';

// abstract class Bird {
// final String name;
// final String sound;
// int soundCount = 0;
// int delay = 1; // 각 새의 우는 타이밍

// Bird(this.name, this.sound);

// Future<void> makeSound(int currentTime) async {
// if (soundCount < 4 && currentTime % delay == 0) {
// print(sound);
// }
// }
// }

abstract class Bird {
  final String name;
  final String sound;

  Bird(this.name, this.sound);

  Future<void> makeSound(int currentTime);
}

class Bird1 extends Bird {
  Bird1(super.name, super.sound);

  @override
  Future<void> makeSound(int currentTime) async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: 1));
      print(sound);
    }
/*for (;;) { // 무한루프
await Future.delayed(Duration(seconds: 1));
print(sound);
}*/
  }
}

class Bird2 extends Bird {
  Bird2(super.name, super.sound);

  @override
  Future<void> makeSound(int currentTime) async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: 2));
      print(sound);
    }
// for (;;) { // 무한루프
// await Future.delayed(Duration(seconds: 2));
// print(sound);
// }
  }
}

class Bird3 extends Bird {
  Bird3(super.name, super.sound);

  @override
  Future<void> makeSound(int currentTime) async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: 3));
      print(sound);
    }

// for (;;) { // 무한루프
// await Future.delayed(Duration(seconds: 3));
// print(sound);
// }
  }
}

void main() async {
  final bird1 = Bird1("새1", "꾸우");
  final bird2 = Bird2("새2", "까악");
  final bird3 = Bird3("새3", "짹짹");

  void exercise1() async {
    await Future.wait([
      bird1.makeSound(1),
      bird2.makeSound(2),
      bird3.makeSound(3),
    ]);
  }

  void exercise2() async {
    Timer(Duration(seconds: 10), () {
      print('10초 경과. 프로그램을 종료합니다.');
      exit(0);
    });

    await Future.wait([
      bird1.makeSound(1),
      bird2.makeSound(2),
      bird3.makeSound(3),
    ]);
  }
}