
// 새소리
import 'dart:io';

Future<void> birdChirp(String chirpingSound, int intervalSeconds) async {
    for (;;) {
    await Future.delayed(Duration(seconds: intervalSeconds));
    print(chirpingSound);
  }
}

Future<void> main() async {

  // 각 새의 지저기는 소리를 설정한다.
  final bird1 = birdChirp("꾸우", 1);  //1초마다
  final bird2 = birdChirp("까악", 2);  //2초마다
  final bird3 = birdChirp("짹짹", 3);  //3초마다


  await Future.delayed(Duration(seconds: 10));
  print("창문 닫음, 새소리가 안들려요.");
  exit(0);


}



