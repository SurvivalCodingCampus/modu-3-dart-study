class TaskException {
  static final invalidName = CustomException(message: '❎이름은 3자 이상이어야 합니다.');
  static final invalidMp = CustomException(message: '❎마법사의 MP는 0 이상이어야 합니다.');
  static final invalidWand = CustomException(message: '❎지팡이를 없앨 순 없습니다.');
  static final invalidPower = CustomException(
    message: '❎지팡이의 마력은 0.5 이상 100.0 이하여야 합니다.',
  );
}

class CustomException implements Exception {
  final String message;

  CustomException({required this.message});
}
