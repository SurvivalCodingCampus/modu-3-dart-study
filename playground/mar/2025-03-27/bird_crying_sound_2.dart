import 'crow.dart';
import 'pigeon.dart';
import 'sparrow.dart';

Future<void> birdSoundTime(int time) async {
  Pigeon pigeon = Pigeon();
  Crow crow = Crow();
  Sparrow sparrow = Sparrow();

  // int time = 10;
  Stopwatch stopwatch = Stopwatch()..start();

  Future<void> pigeonSound() async {
    while (stopwatch.elapsed.inSeconds < time) {
      await pigeon.cryingSound();
    }
  }

  Future<void> crowSound() async {
    while (stopwatch.elapsed.inSeconds < time) {
      await crow.cryingSound();
    }
  }

  Future<void> sparrowSound() async {
    while (stopwatch.elapsed.inSeconds < time) {
      await sparrow.cryingSound();
    }
  }

  Future<void> timePrint() async {
    for (int i = 0; i <= time; i++) {
      print('$i초');
      await Future.delayed(Duration(seconds: 1));
    }
  }

  await Future.wait([sparrowSound(), crowSound(), pigeonSound(), timePrint()]);

  stopwatch.stop();
}

void main() async {
  await birdSoundTime(10);
}
