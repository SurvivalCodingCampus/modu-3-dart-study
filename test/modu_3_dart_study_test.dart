int sumOfMultiples(int limit) {
  int sum = 0;

  for (int i = 1; i < limit; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      sum += i;
    }
  }

  return sum;
}

void main() {
  print(sumOfMultiples(10)); // 23 (3 + 5 + 6 + 9)
  print(sumOfMultiples(20)); // 78
}