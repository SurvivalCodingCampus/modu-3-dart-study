bool isPrime(int number) {
  if (number < 2) {
    return false;
  }

  bool isPrime = true;

  // 소수 : 1과 자기 자신으로만 나누어지는 수
  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      isPrime = false;
      break;
    }
  }

  return isPrime;
}

void main() {
  print(isPrime(7)); // true가 출력되어야 합니다
  print(isPrime(12)); // false가 출력되어야 합니다
  print(isPrime(23)); // true가 출력되어야 합니다
  print(isPrime(100000000)); // true가 출력되어야 합니다
}
