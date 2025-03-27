// Future<String> fetchData(String id, int delay) {
//   return Future.delayed(Duration(seconds: delay), () {
//     print('${DateTime.now().toString().substring(0, 19)}');
//     return '데이터 $id';
//   });
// }
//
// void main() {
//   print('${DateTime.now().toString().substring(0, 19)}: 시작');
//
//   fetchData('A', 2).then((data) => print('결과 A: $data'));
//   print('${DateTime.now().toString().substring(0, 19)}: 모든 작업이 시작됨');
// }

// Future<String> fetchData() async {
//   await Future.delayed(Duration(seconds: 1));
//   return '데이터';
// }
//
// void main() async {
//   String data = await fetchData();
//   print(data);
// }

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

// Future<void> printInts() async {
//   List<int> results = [
//     await getInt1(),
//     await getInt2(),
//     await getInt3(),
//     await getInt4(),
//     await getInt5(),
//   ];
//
//   print(results);
// }

// void main() async {
//   Stopwatch stopwatch = Stopwatch()..start();
//   await printInts();
//   print(stopwatch.elapsed);
// }

Future<void> printParalleInts() async {
  List<int> results = [
    await getInt1(),
    await getInt2(),
    await getInt3(),
    await getInt4(),
    await getInt5(),
  ];

  print(results);
}

void main() async {
  Stopwatch stopwatch = Stopwatch()..start();
  await printInts();
  print(stopwatch.elapsed);
}