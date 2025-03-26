void main() {
  //연습 문제 1
  //final numString = '10.5';
  //int num = int.parse(numString);
  //print(num);

  //연습문제 2
  final numString = '10.5';
  int num = 0;
  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
  }
  print(num);
}
