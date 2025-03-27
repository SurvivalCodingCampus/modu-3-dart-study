import 'dart:async';

void main() async {
  Future bird1() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      print("꾸우");
    });
  }

  Future bird2() async {
    Timer.periodic(Duration(seconds: 2), (timer) {
      print("까악");
    });
  }

  Future bird3() async {
    Timer.periodic(Duration(seconds: 3), (timer) {
      print("짹짹");
    });
  }

  Stopwatch stopwatch1 = Stopwatch()..start();
  await bird1().timeout(
    Duration(seconds: 10),
    onTimeout: () {
      print("watch1 ${stopwatch1.elapsed}");
    },
  );
  Stopwatch stopwatch2 = Stopwatch()..start();

  await bird2().timeout(
    Duration(seconds: 10),
    onTimeout: () {
      print("watch2 ${stopwatch2.elapsed}");
    },
  );

  Stopwatch stopwatch3 = Stopwatch()..start();
  await bird3().timeout(
    Duration(seconds: 10),
    onTimeout: () {
      print("watch3 ${stopwatch3.elapsed}");
    },
  );
}
