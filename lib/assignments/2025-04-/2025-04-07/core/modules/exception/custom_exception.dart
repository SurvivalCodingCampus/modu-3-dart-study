abstract class CustomException implements Exception {
  final int code;
  final String message;

  const CustomException(this.code, this.message);

  @override
  String toString() {
    return 'code: $code, message: $message';
  }
}

// 회원가입 Exception
sealed class RegistrationError extends CustomException {
  const RegistrationError(super.code, super.message);
}

class InvalidEmail extends RegistrationError {
  InvalidEmail() : super(10000, '유효하지 않은 이메일 주소입니다.');
}

class WeakPassword extends RegistrationError {
  WeakPassword() : super(10001, '비밀번호는 6자 이상이어야 합니다.');
}

class NetworkError extends RegistrationError {
  final String errorMessage;
  NetworkError(this.errorMessage)
    : super(50000, '네트워크 오류가 발생했습니다.: $errorMessage');
}

// Photo Exception
class ImageValidateError extends CustomException {
  ImageValidateError() : super(40000, '비속어를 사용할 수 없습니다.');
}

// Photo Exception
class ImageNetworkError extends CustomException {
  ImageNetworkError() : super(50000, '알 수 없는 네트워크 에러');
}
