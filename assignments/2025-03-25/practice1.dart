void main() {
  final numString = '10.5';
  int num = 0;
  try {
    num = int.parse(numString);
  } on FormatException {}

  print(num);
} //runtime error 발생시키기, try catch()문 사용 예외처리 -> 예외 발생 0으로 처리
