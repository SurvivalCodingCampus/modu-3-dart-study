void main() {
  // String name = 'Jay';

  // int Function(int, int) func = sum;
  // print(func(1, 1));

  myHighOrderFunction((String value) => print('$value : Hi'));
}

int sum(int a, int b) => a + b;

void myHighOrderFunction(void Function(String) func) {
  print('시작');
  func('Hello');
  print('종료');
}
