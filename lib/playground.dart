Future<int> getInt1() async {
  await Future.delayed(Duration(seconds: 1));
  return 1;
}

Future<int> getInt2() async {
  await Future.delayed(Duration(seconds: 1));
  return 1;
}

Future<int> getInt3() async {
  await Future.delayed(Duration(seconds: 1));
  return 1;
}

Future<int> getInt4() async {
  await Future.delayed(Duration(seconds: 1));
  return 1;
}

Future<int> getInt5() async {
  await Future.delayed(Duration(seconds: 1));
  return 1;
}

void main() async {
  Future<void> printInts() async {
    List<int> futures = [
      await getInt1(),
      await getInt2(),
      await getInt3(),
      await getInt4(),
      await getInt5(),
    ];

    print(futures);
  }

  Stopwatch stopWatch = Stopwatch()..start();

  await printInts();

  print(stopWatch.elapsed);
}
