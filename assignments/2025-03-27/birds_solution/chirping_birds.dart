
// 새소리
Future<void> birdChirp(String chirpingSound, int intervalSeconds, int times) async {
    for (int i = 0; i < times; i++) {
    await Future.delayed(Duration(seconds: intervalSeconds));
    print(chirpingSound);
  }
}

Future<void> main() async {

  // 각 새의 지저기는 소리를 설정한다.
  final bird1 = birdChirp("꾸우", 1, 4);  //1초마다
  final bird2 = birdChirp("까악", 2, 4);  //2초마다
  final bird3 = birdChirp("짹짹", 3, 4);  //3초마다

  await Future.wait([bird1, bird2, bird3]);
  print("모든 새소리 끝");
}