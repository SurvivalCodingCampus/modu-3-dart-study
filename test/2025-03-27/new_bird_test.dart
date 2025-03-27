import 'dart:async';

void main() async {
  // 은렬님 코드보고 피드백 받은
  // 정확히 10초 코드
  Timer timer = Timer.periodic(Duration(seconds: 1), (_) {
    print("꾸우");
  });
  Timer twoTimer = Timer.periodic(Duration(seconds: 2), (_) {
    print("까악");
  });
  Timer threeTimer = Timer.periodic(Duration(seconds: 3), (_) {
    print("짹짹");
  });

  await Future.delayed(Duration(seconds: 10), () {
    timer.cancel();
    twoTimer.cancel();
    threeTimer.cancel();
  });
}
