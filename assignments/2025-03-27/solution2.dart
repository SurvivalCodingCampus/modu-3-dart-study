void main() async {
  print('🌅 아침이 밝았습니다!');

  Bird bird1 = Bird(sound: '🐦‍꾸우', interval: 1);
  Bird bird2 = Bird(sound: '🐤까악', interval: 2);
  Bird bird3 = Bird(sound: '🐧짝짹', interval: 3);

  await Future.wait([
    bird1.makeSound(4),
    bird2.makeSound(4),
    bird3.makeSound(4),
  ]);
  print("끝");
}

class Bird {
  String sound;
  int interval;

  Bird({required this.sound, required this.interval});

  Future<void> makeSound(int count) async {
    for (int i = 1; i <= count; i++) {
      await Future.delayed(Duration(seconds: interval));
      print('$sound (${DateTime.now()})');
    }
  }
}
