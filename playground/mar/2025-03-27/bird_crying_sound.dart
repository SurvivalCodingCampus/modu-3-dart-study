import 'crow.dart';
import 'pigeon.dart';
import 'sparrow.dart';

Future<void> birdSoundCount(int count) async {
  Pigeon pigeon = Pigeon();
  Crow crow = Crow();
  Sparrow sparrow = Sparrow();

  // int count = 4;

  Future<void> pigeonSound() async {
    for (int i = 0; i < count; i++) {
      await pigeon.cryingSound();
    }
  }

  Future<void> crowSound() async {
    for (int i = 0; i < count; i++) {
      await crow.cryingSound();
    }
  }

  Future<void> sparrowSound() async {
    for (int i = 0; i < count; i++) {
      await sparrow.cryingSound();
    }
  }

  Future<void> timePrint() async {
    Stopwatch stopwatch = Stopwatch()..start();

    for (int i = 0; i < (count * 3 - 2); i++) {
      print('$i초');
      await Future.delayed(Duration(seconds: 1));
    }
    stopwatch.stop();
  }

  await Future.wait([sparrowSound(), crowSound(), pigeonSound(), timePrint()]);
}

void main() async {
  await birdSoundCount(4);
}
