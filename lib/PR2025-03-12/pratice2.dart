// 주어진 숫자가 소수 인지 확인 하는 함수를 작성하세요.
bool isPrime(int number) {
  // 2보다 작은 1과 0은 소수가 아님
  if (number < 2) {
    return false;
  }
  // 2는 소수가 됨
  if (number == 2) {
    return true;
  }
  //만약 2로 나누어진다면 소수가 안됨
  if (number % 2 == 0) {
    return false;
  }
  //i가 3이상의 홀수의 제곱근을 통해 number가 소수인지 아닌지 구분
  for (int i = 3; i * i <= number; i += 2) {
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
