class ErrorCatch implements Exception {
  final int zero;

  ErrorCatch(this.zero);

  @override
  String toString() {
    return '$zero';
  }
}

void main() {
  try {
    final numString = '10.5';
    int num = int.parse(numString);
    print(num);
  } catch (e) {
    throw ErrorCatch(0);
  }
}
