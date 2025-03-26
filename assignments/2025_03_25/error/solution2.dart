void main() {
  final numString = '10.5';
  int num;

  try {
    num = int.parse(numString);
  } on FormatException {
    num = 0;
  }
  print(num);
}
