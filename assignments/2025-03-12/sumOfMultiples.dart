void main() {
  print(sumOfMultiples(10)); // 23이 출력되어야 합니다 (3 + 5 + 6 + 9 = 23)
  print(sumOfMultiples(20)); // 78이 출력되어야 합니다
}

// 주어진 범위 내에서 3의 배수 또는 5의 배수인 모든 숫자의 합을 구하는 함수를 작성하세요.
int sumOfMultiples(int limit) {
  int result = 0;

  for(int i = 0; i < limit; i++){
    if(( i % 3 == 0 ) || (i % 5 == 0)){
      result = result + i;
    }
  }

  return result;
}
