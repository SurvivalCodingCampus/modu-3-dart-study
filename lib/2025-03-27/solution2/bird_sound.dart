import 'dart:async';

void main() async {}

Future bird({required String sound, required int second}) async {
  int counter = 4;
  Timer.periodic(Duration(seconds: second), (timer) {
    print(sound);
    counter--;
    if (counter == 0) {
      timer.cancel();
    }
  });
}
