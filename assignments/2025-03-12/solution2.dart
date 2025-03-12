// 주어진 숫자가 소수인지 확인하는 함수를 작성하세요.
bool isPrime(int number) {
  // for문과 if문을 사용하여 구현하세요
  if (number < 2) {
    return false;
  }
  for (int num = 2; num < number ~/ 2; num++) {
    if (number % num == 0) {
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
