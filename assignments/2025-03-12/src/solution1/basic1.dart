int sumOfMultiples(int limit) {
  // for문과 if문을 사용하여 구현하세요

  int sum = 0;
  for (int i = 1; i < limit; i++){
    if (i % 3 == 0 || i % 5 == 0) {
      sum += i;
    }
  }
  return sum;
}

void main() {
  print(sumOfMultiples(10)) ;// 23이 출력되어야 합니다 (3 + 5 + 6 + 9 = 23)
  print(sumOfMultiples(20)); // 78이 출력되어야 합니다
}