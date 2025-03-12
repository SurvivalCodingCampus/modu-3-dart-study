bool isPrime(int number) {
  if (number < 2) {
    return false;
  }
  if (number == 2 || number == 3) {
    return true;
  }
  if (number % 2 == 0) {
    return false;
  }
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