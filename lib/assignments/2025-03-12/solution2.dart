// 주어진 숫자가 소수인지 확인하는 함수
bool isPrime(int number) {
  // 1은 소수가 아니므로 바로 false를 반환
  if (number <= 1) {
    return false;
  }

  // 반환될 값 받기
  bool isPrime = true;

  // 2부터 number-1까지 반복하면서 나누어 떨어지는 숫자가 있으면 소수가 아님
  // (1과 자기자신 수를 빼기 위해서)
  for (int i = 2; i < number; i++) {
    // number가 i로 나누어지면 소수가 아님
    // 자기자신 보다 작은 수 보다 나눠지면 소수 아님
    if (number % i == 0) {
      isPrime = false;
      break;
    }
  }

  // 반복문을 끝까지 통과했다면 소수이므로 true 반환
  return isPrime;
}

void main() {
  print(isPrime(7)); // true (7은 소수)
  print(isPrime(12)); // false (12는 소수가 아님)
  print(isPrime(23)); // true (23은 소수)
}
