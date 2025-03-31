// 첫번째 새 '꾸우'  1초마다
// 두번째 새 '까악' 2초마다
// 세번째 새 '짹짹' 3초마다
// 무제한 출력 후 10초 후 프로그램 종료

// Future<void> birdSound1() async {
//   print('꾸우');
//   await Future.delayed(Duration(seconds: 1));
// }
//
// Future<void> birdSound2() async {
//   print('까악');
//   await Future.delayed(Duration(seconds: 2));
// }
//
// Future<void> birdSound3() async {
//   print('짹짹');
//   await Future.delayed(Duration(seconds: 3));
// }
//
// Future<void> printBird() async {
//   Stopwatch stopwatch = Stopwatch()..start();
//   while (stopwatch.elapsed.inSeconds < 10) {
//     await Future.wait([birdSound1(), birdSound2(), birdSound3()]);
//   }
// }
//
// void main() async {
//
//   await printBird();
//   print(stopwatch.elapsed);
// }
