// sound 울음소리
// duration 울음 주기
// num 종료 횟수
Future<void> bird(String sound, int duration, int num) async {
  for (int count = 1; count <= num; count++) {
    print('$sound $count번');
    await Future.delayed(Duration(seconds: duration));
  }
}

void main() async{
  List<Future<void>> futures = [
    bird('꾸우', 1, 4),
    bird('까악', 2, 4),
    bird('짹짹', 3, 4)
  ];
  await Future.wait(futures);
  print('프로그램이 종료되었습니다');
}