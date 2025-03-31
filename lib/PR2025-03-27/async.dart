//1초 기다렸다 1반환
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

//이방식은 5초가 소요됨
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

//1초도 안되게 소요함, 병렬처리
Future<void> printParallelInts() async {
  List<Future<int>> results = [
    getInt1(),
    getInt2(),
    getInt3(),
    getInt4(),
    getInt5(),
  ];
  //병렬처리
  final values = Future.wait(results);
  print(values);
}

void main() async {
  Stopwatch stopwatch = Stopwatch()..start();
  await printInts();
  print(stopwatch.elapsed);
  Stopwatch stopwatch2 = Stopwatch()..start();
  await printParallelInts();
  print(stopwatch2.elapsed);
}
