Future<void> birdBark(String sound, int seoncds, int count) async {
  for (int i = 0; i < count; i++) {
    await Future.delayed(Duration(seconds: seoncds));
    print(sound);
  }
}

void main() async {
  Stopwatch stopwatch = Stopwatch()..start();

  await Future.wait([
    birdBark("꾸우", 1, 4),
    birdBark("까악", 2, 4),
    birdBark("짹짹", 3, 4),
  ]);

  print("총 실행 시간: ${stopwatch.elapsed}");
}
