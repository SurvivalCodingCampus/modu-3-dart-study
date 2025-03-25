/*
//  FormatException: Invalid radix-10 number (at character 1)

void main() {
  final numString = '10.5';
  int num = int.parse(numString);
  print(num);
}
*/

void main() {
  final numString = '10.5';
  int num;

  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
  }

  print(num);
}
