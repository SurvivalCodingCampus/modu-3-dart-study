void main() {
  // 다음과 같은 코드를 작성, 실행 후 runtime error 를 발생하시오
  final numString = '10.5';
  int num;

  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
    print('$e -> exception이 발생하여 num을 0으로 초기화');
  }


  print('num = $num');
}
