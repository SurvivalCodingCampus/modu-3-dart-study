void main() {
  final numString = '10.5';
  int num;

  try {
    num = int.parse(numString);
  } catch (e) {
    print('예외 발생: $e');
    num = 0;
  }
  // finally {
  //   print('결과: $num');
  // }
  print('결과: $num');

}