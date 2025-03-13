// 주어진 숫자(limit)보다 작은 숫자 중 3의 배수나 5의 배수인 숫자들의 합을 구하는 함수
int sumOfMultiples(int limit) {
  int sum = 0; // 합을 저장할 변수, 처음에는 0으로 시작

  // 1부터 limit-1까지 반복
  for (int i = 1; i < limit; i++) {
    // 숫자 i가 3의 배수이거나 5의 배수이면
    if (i % 3 == 0 || i % 5 == 0) {
      sum += i; // 합에 i를 더함
    }
  }

  return sum; // 모든 배수들의 합을 반환
}

void main() {
  // sumOfMultiples(10)을 호출하여 10보다 작은 3의 배수나 5의 배수의 합을 구함
  print(sumOfMultiples(10)); // 23 (3 + 5 + 6 + 9 = 23)

  // sumOfMultiples(20)을 호출하여 20보다 작은 3의 배수나 5의 배수의 합을 구함
  print(sumOfMultiples(20)); // 78 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 = 78)
}
