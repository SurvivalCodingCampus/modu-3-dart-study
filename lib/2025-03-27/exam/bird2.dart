import 'dart:async';

Timer repeat() {
  return Timer.periodic(
    Duration(seconds: 2),
        (timer) async => await () {},
  );
}

Future bird({required String sound, required int second}) async {
  int counter = 4;
  Timer.periodic(Duration(seconds: second), (timer) {
    print(sound);
    counter--;
    if (counter == 0) {
      timer.cancel();
      print("카운트 종료");
    }
  });

  print("bird함수 끝");
}

void main() async {
  await bird(sound: "꾸우", second: 1);
  await bird(sound: "까악", second: 2);
  await bird(sound: "짹짹", second: 3);
}