int? stringToInt(String numString) {
  int? num;
  try {
    // final numString = '10.5';
    num = int.parse(numString);
  } on FormatException {
    num = 0;
  } finally {
    print(num);
    return num;
  }
}
