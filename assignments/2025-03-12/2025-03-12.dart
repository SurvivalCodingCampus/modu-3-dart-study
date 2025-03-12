int sumOfMultiples(int limit) {
  int sum = 0;

  for (int i = 1; i < limit; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      sum += i;
    }
  }

  return sum;
}

bool isPrime(int number) {
  for (int i = 2; i < number; i++)
  {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  print(sumOfMultiples(10)); // 23 (3 + 5 + 6 + 9)
  print(sumOfMultiples(20)); // 78
  print(isPrime(7)); // true가 출력되어야 합니다
  print(isPrime(12)); // false가 출력되어야 합니다
  print(isPrime(23)); // true가 출력되어야 합니다
}