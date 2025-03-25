void main() {
  // 다음과 같은 코드를 작성, 실행 후 runtime error 를 발생하시오
  final numString = '10.5';
  int num;

  try {
    num = int.parse(numString);
  } catch (e) {
    print(e);
  }
  num = 0;

  print('num = $num');
}
