// 주어진 숫자가 소수인지 확인하는 함수를 작성하세요.
bool isPrime(int number) {
  for (int i = 2; i < number; i++) {
    // print('for i : $i');
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
