sealed class RegistrationError implements Error {
  final String? errorMessage;

  const RegistrationError._internal(this.errorMessage);

  factory RegistrationError.invalidEmail({String? message}) = InvalidEmailError;
  factory RegistrationError.weakPassword({String? message}) = WeakPasswordError;
  factory RegistrationError.networkError({String? message}) = NetworkError;

  @override
  String toString() => errorMessage ?? '';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationError &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => errorMessage.hashCode;

  @override
  StackTrace? get stackTrace => StackTrace.current;
}

final class InvalidEmailError extends RegistrationError {
  static const defaultErrorMessage = '유효하지 않은 이메일 주소입니다.';
  const InvalidEmailError({String? message})
    : super._internal(message ?? defaultErrorMessage);
}

final class WeakPasswordError extends RegistrationError {
  static const defaultErrorMessage = '비밀번호는 6자 이상이어야 합니다.';
  const WeakPasswordError({String? message})
    : super._internal(message ?? defaultErrorMessage);
}

final class NetworkError extends RegistrationError {
  static const defaultErrorMessage = '네트워크 오류가 발생했습니다.';
  const NetworkError({String? message})
    : super._internal(message ?? defaultErrorMessage);
}
