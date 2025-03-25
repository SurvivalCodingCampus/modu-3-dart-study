void main() {
  try {
    // 에러가 날 것 같은 코드
    someError2();
  } on FormatException {
    // 특정 예외를 처리하는 코드
    throw FormatException('FormatException 이 발생했습니다.');
  } catch (e) {
    // e 에러의 정보를 담고 있는 객체
    print(e);
  } finally {
    print('에러가 있는 말든 실행');
  }
}

void someError2() {
  try {
    someError();
  } catch (e) {
    rethrow;
  }
}

void someError() {
  // 강제 에러발생
  throw FormatException('FormatException 이 발생했습니다.');
}
