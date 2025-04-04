class TaskException {
  static final invalidIndex = CustomException(message: '❎인덱스 범위에 벗어났습니다.');
  static final invalidCharacter = CustomException(message: '❎알파벳이 아닙니다.');
}

class CustomException implements Exception {
  final String message;

  CustomException({required this.message});

  @override
  String toString() {
    return 'CustomException: $message';
  }
}
