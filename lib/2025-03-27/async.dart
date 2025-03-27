void main() async {
  // fetchData('전체데이터', (e) => print(e));

  // Stopwatch stopwatch = Stopwatch()..start();

  // await printInts();
  // await printParallelInts();

  // print(stopwatch.elapsed);
  // for (int i = 0; i < 4; i++) {
  //   bird1();
  //   bird2();
  //   bird3();
  // }
  // bird1();
  // bird2();
  // bird3();
  Future.wait([bird1(), bird2(), bird3()]);
}

Future<void> bird1() async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('꾸우');
  }
}

Future<void> bird2() async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: 2));
    print('까악');
  }
}

Future<void> bird3() async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: 3));
    print('짹짹');
  }
}

void fetchData(String job, void Function(String) onSuccess) {
  print('데이터 $job 가져오는중');
  onSuccess('20%');
  onSuccess('60%');
  onSuccess('100%');
}

Future<int> getInt1() async {
  await Future.delayed(Duration(seconds: 1));
  return 1;
}

Future<int> getInt2() async {
  await Future.delayed(Duration(seconds: 1));
  return 2;
}

Future<int> getInt3() async {
  await Future.delayed(Duration(seconds: 1));
  return 3;
}

Future<int> getInt4() async {
  await Future.delayed(Duration(seconds: 1));
  return 4;
}

Future<int> getInt5() async {
  await Future.delayed(Duration(seconds: 1));
  return 5;
}

Future<void> printInts() async {
  List<int> results = [
    await getInt1(),
    await getInt2(),
    await getInt3(),
    await getInt4(),
    await getInt5(),
  ];
  print(results);
}

Future<void> printParallelInts() async {
  List<Future<int>> futures = [
    getInt1(),
    getInt2(),
    getInt3(),
    getInt4(),
    getInt5(),
  ];
  List<int> results = await Future.wait(futures);
  print(results);
}
