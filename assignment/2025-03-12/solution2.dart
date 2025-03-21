bool isPrime(int number) {
  // 2 미만의 수는 소수가 아님
  if (number < 2) {
    return false;
  }
  
  // 2는 소수
  if (number == 2) {
    return true;
  }
  
  // 짝수는 2를 제외하고 소수가 아님
  if (number % 2 == 0) {
    return false;
  }
  
  // √number까지만 확인 (i*i <= number)
  for (int i = 3; i * i <= number; i += 2) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  print(isPrime(7));
  print(isPrime(12));
  print(isPrime(23));
}