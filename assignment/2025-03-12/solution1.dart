int sumOfMultiples(int limit) {
  int result = 0;
  for (int i = 1; i < limit; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      result += i;
    }
  }

  return result;
}

void main() {
  print(sumOfMultiples(10));
  print(sumOfMultiples(20));
}