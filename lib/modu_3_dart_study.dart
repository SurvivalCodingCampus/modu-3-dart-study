void main() {
  print('${sumOfMultiples(20)}');
  print('${isPrime(241)}');
}

int sumOfMultiples(int limit) {
  List<int> numbers = List.generate(limit, (index) => index);
  int sum = 0;

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] % 3 == 0 || numbers[i] % 5 == 0) {
      sum += numbers[i];
    }
  }
  return sum;
}

bool isPrime(int number) {
  bool isPrime = true;

  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      isPrime = false;
    }
  }
  return isPrime;
}
