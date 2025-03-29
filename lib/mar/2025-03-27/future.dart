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

void main(List<String> arguments) async {
  Stopwatch stopwatch = Stopwatch()..start();

  await printInts();
  await printParallelInts();

  print(stopwatch.elapsed);
}
