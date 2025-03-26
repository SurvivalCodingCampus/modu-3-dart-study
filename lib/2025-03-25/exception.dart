void main() {
  final name = '오준석';
  try {
    // 에러 날 것 같은 코드
  } catch (e) {
    // 에러 발생 시 코드
  }
}

class MyException implements Exception {
  final String message;

  MyException(this.message);

  @override
  String toString() {
    return 'MyException{message: $message}';
  }
}