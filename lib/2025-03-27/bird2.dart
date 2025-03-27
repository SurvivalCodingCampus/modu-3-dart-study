// sound 울음소리
// num 울음 주기
// endSeconds 종료 시간
Future<void> bird2(String sound, int duration, int endSeconds) async {
  int count = 0;
  while (count < endSeconds) {

    if (count % duration == 0) {
      print('$sound ${(count ~/ duration) + 1}번');
    }
    count++;
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() async{
  List<Future<void>> futures = [
    bird2('꾸우', 1, 10),
    bird2('까악', 2, 10),
    bird2('짹짹', 3, 10)
  ];
  await Future.wait(futures);
  print('프로그램이 종료되었습니다');
}