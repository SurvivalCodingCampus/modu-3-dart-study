void main(List<String> args) {
  final numString = '10.5';
  try {
    int num = int.parse(numString);
    print(num);
  } catch (e) {
    // print(e);
    int num = 0;
    print(num);
  }
}