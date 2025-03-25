class MyException implements Exception {
  final String message;

  const MyException([this.message = '']);

  @override
  String toString() =>
      message.isEmpty ? 'MyException' : 'MyException: $message';
}

void main() {
  try {
    throw MyException();
  } on MyException {
    print("MyException Catch");
  } on Exception {
    print("Exception Catch");
  } catch (e) {
    print("catch E");
  } finally {
    print("finally");
  }
}
