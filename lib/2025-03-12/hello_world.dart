
void main() {
  print(sumOfMultiples(10)); // 23이 출력되어야 합니다 (3 + 5 + 6 + 9 = 23)
  print(sumOfMultiples(20)); // 78이 출력되어야 합니다

  print(isPrime(7)); // true가 출력되어야 합니다
  print(isPrime(12)); // false가 출력되어야 합니다
  print(isPrime(23)); // true가 출력되어야 합니다
}

// 주어진 범위 내에서 3의 배수 또는 5의 배수인 모든 숫자의 합을 구하는 함수를 작성하세요.
int sumOfMultiples(int limit) {
  int sum = 0;
  for (int i = 1; i < limit; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      sum += i;
    }
  }
  return sum;
}

// 주어진 숫자가 소수인지 확인하는 함수를 작성하세요.
bool isPrime(int number) {
  int count = 0;
  for (int i = 2; i <= number; i++) {
    if (number % i == 0) {
      count++;
    }
  }
  return count > 1 ? false : true;
}