void main() {
  try {
    typeError();
  } catch (e) {
    print(0);
  }
}

void typeError() {
  final numString = '10.5';

  int num = int.parse(numString);
  print(num);
}
