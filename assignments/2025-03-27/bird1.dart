// 첫번째 새 '꾸우'  1초마다
// 두번째 새 '까악' 2초마다
// 세번째 새 '짹짹' 3초마다
// 4번 출력 후 프로그램 종료

Future<void> birdSound1() async {
  for (int i = 0; i < 4; i++) {
    print('꾸우');
    await Future.delayed(Duration(seconds: 1));
  }
}

Future<void> birdSound2() async {
  for (int i = 0; i < 4; i++) {
    print('까악');
    await Future.delayed(Duration(seconds: 2));
  }
}

Future<void> birdSound3() async {
  for (int i = 0; i < 4; i++) {
    print('짹짹');
    await Future.delayed(Duration(seconds: 3));
  }
}

Future<void> printBird() async {
  await Future.wait([birdSound1(), birdSound2(), birdSound3()]);
  // List<Future<void>> results = [birdSound1(), birdSound2(), birdSound3()];
  //List<void> result = await Future.wait(results); //끝나는 시간 확인
}

void main() async {
  Stopwatch stopwatch = Stopwatch()..start();
  await printBird();
  print(stopwatch.elapsed);
}
