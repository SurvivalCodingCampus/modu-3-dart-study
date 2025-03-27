void main() async {
  final bird1 = Bird(sound: '꾸우', seconds: 1);
  final bird2 = Bird(sound: '까악', seconds: 2);
  final bird3 = Bird(sound: '짹짹', seconds: 3);

  // 2번 문제
  // Future.wait([bird1.sing(), bird2.sing(), bird3.sing()]);

  // 3번 문제
  //await Future.wait([bird2.sing2(), bird3.sing2(), bird1.sing2()]);
  await Future.wait([sing2(1,'꾸우'), sing2(2,'까악'), sing2(3,'짹짹')]);
}

Future<void> sing(int seconds, String sound) async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: seconds));
      print(sound);
    }
  }

  Future<void> sing2(int seconds, String sound) async {
    //   while (_timer > 0) {
    //     if (_timer < 0) {
    //       break;
    //     }
    //     await Future.delayed(Duration(seconds: seconds));
    //     print(sound);
    //     _timer -= seconds;
    //   }
    // }
    for (int i = 0; i < 10; i += seconds) {
      await Future.delayed(Duration(seconds: seconds));
      print(sound);
    }
  }

class Bird {
  final String sound;
  final int seconds;
  int _timer = 10;

  Bird({required this.sound, required this.seconds});

  Future<void> sing() async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: seconds));
      print(sound);
    }
  }

  Future<void> sing2() async {
    //   while (_timer > 0) {
    //     if (_timer < 0) {
    //       break;
    //     }
    //     await Future.delayed(Duration(seconds: seconds));
    //     print(sound);
    //     _timer -= seconds;
    //   }
    // }
    for (int i = 0; i < 10; i += seconds) {
      await Future.delayed(Duration(seconds: seconds));
      print(sound);
    }
  }
}
