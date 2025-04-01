Future<void> fetchOrder1() async {
  Future.delayed(Duration(seconds: 5), () {
    print('5초후 출력');
  });
}

Future<void> fetchOrder2() async {
  Future.delayed(Duration(seconds: 3), () {
    print('3초후 출력');
  });
}

void main() async {
  await fetchOrder1();
  await fetchOrder2();
  print("오청중");
}
