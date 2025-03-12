// 주어진 숫자가 소수인지 확인하는 함수를 작성하세요.
bool isPrime(int number) {
  // for문과 if문을 사용하여 구현하세요
  if (number < 2) {
    return false;
  }

  // 어떤 소수도 number의 제곱근보다 큰 수로 나눠지지 않는다는 규칙을 이용.
  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

void main() {
  print(isPrime(7)); // true가 출력되어야 합니다
  print(isPrime(12)); // false가 출력되어야 합니다
  print(isPrime(23)); // true가 출력되어야 합니다
}
