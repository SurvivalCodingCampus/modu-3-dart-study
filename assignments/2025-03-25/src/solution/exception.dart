void main() {
  final numString = '10.5';

  int checkException(String numString) {
    try {
      return int.parse(numString);
    } catch (e) {
      return 0;
    }
  }

  print(checkException(numString));
}
