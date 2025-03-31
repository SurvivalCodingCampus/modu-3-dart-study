void main() async {
  final bird1 = Bird(sound: '꾸우', seconds: 1);
  final bird2 = Bird(sound: '까악', seconds: 2);
  final bird3 = Bird(sound: '짹짹', seconds: 3);

  // 2번 문제
  Future.wait([bird1.sing(), bird2.sing(), bird3.sing()]);
}

class Bird {
  final String sound;
  final int seconds;

  Bird({required this.sound, required this.seconds});

  Future<void> sing() async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: seconds));
      print(sound);
    }
  }
}
