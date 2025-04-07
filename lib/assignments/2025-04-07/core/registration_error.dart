enum RegistrationError {
  invalidEmail, // 유효하지 않은 이메일 형식
  weakPassword, // 약한 패스워드
  networkError; // 네트워크 오류

  static String getMessage(RegistrationError error) {
    switch (error) {
      case RegistrationError.invalidEmail:
        return '유효하지 않은 이메일 형식입니다. 올바른 이메일을 입력해주세요.';
      case RegistrationError.weakPassword:
        return '패스워드가 너무 약합니다. 더 강력한 패스워드를 사용해주세요.';
      case RegistrationError.networkError:
        return '네트워크 오류가 발생했습니다. 인터넷 연결을 확인해주세요.';
    }
  }
}
