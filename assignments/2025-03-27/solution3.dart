import 'dart:io';

void main() async {
  print('🌅 아침이 밝았습니다!');

  Bird bird1 = Bird(sound: '🐦‍꾸우', interval: 1);
  Bird bird2 = Bird(sound: '🐤까악', interval: 2);
  Bird bird3 = Bird(sound: '🐧짝짹', interval: 3);

  bool flag = true;

  Future.delayed(Duration(seconds: 10), () {
    flag = false;
    print("🪟창문닫음!");
    // exit(0); // 강제종료,,,,
  });

  await Future.wait([
    bird1.makeSound(() => flag),
    bird2.makeSound(() => flag),
    bird3.makeSound(() => flag),
  ]);

  print("끝");
}

class Bird {
  String sound;
  int interval;

  Bird({required this.sound, required this.interval});

  Future<void> makeSound(bool Function() timer) async {
    while (timer()) {
      await Future.delayed(Duration(seconds: interval));
      print('$sound (${DateTime.now()})');
    }
  }
}
