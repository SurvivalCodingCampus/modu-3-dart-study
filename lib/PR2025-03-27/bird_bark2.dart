import 'dart:async';

Future<void> birdBark(String sound, int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
  print(sound);
}

void main() async {
  Stopwatch stopwatch = Stopwatch()..start();
  Timer? timer;
  timer = await Timer(Duration(seconds: 10), () {
    Future.wait([birdBark("꾸우", 1), birdBark("까악", 2), birdBark("짹짹", 3)]);
  });
  timer.cancel();
  print("총 실행 시간: ${stopwatch.elapsed}");
}
