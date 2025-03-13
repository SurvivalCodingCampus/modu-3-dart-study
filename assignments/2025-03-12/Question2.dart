void main() {
  print(isPrime(7)); // true가 출력되어야 합니다.
  print(isPrime(12)); // false가 출력되어야 합니다.
  print(isPrime(23)); // true가 출력되어야 합니다.
}

//주어진 숫자가 소수 인지 확인 하는 함수를 작성 하세요.
//알고리즘 개선 버전 : 입력받은 수가 클 경우 시간 많이 소요.
//추후  라이브러리 사용시 밀러-라빈 소수 판별법 구현

bool isPrime(int number) {
  // 1 이하의 수는 소수가 아님
  if (number <= 1) {
    return false;
  }

  // 2는 소수임
  if (number == 2) {
    return true;
  }

  // 짝수는 2로 나누어지기에 소수아님
  if (number % 2 == 0) {
    return false;
  }

  // 소수는 제곱근보다 큰 수로 나누어지지 않는다.
  for (int i = 3; i * i <= number; i++) {
    if (number % i == 0) return false;
  }

  return true;
}

//밀러-라빈 소수 판별법 학습 후 구현해 볼 예정.

//주어진 숫자가 소수 인지 확인 하는 함수를 작성 하세요.
/* bool isPrime(int number){
  //for 문과 if 문을 사용 하여 구현 하세요.
  for (int i=2; i<number; i++){
    if(number % i == 0){
      return false;
    }

  }
  return true;
}
*/
