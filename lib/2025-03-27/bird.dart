import 'dart:async';

class Bird {
  int _count = 0;
  final String name;
  final int delay;
  final String sound;

  Bird({required this.name, required this.delay, required this.sound});

  int get count => _count;

  Future<String> tweet() async {
    _count += 1;
    return sound;
  }

  Future<Timer> repeat() async {
    return Timer.periodic(
      Duration(seconds: delay),
      (timer) async => await tweet(),
    );
  }
}
