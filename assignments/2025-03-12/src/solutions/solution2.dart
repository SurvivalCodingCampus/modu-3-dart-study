// 주어진 숫자가 소수인지 확인하는 함수를 작성하세요.
bool isPrime(int number) {
  if (number < 2) return false; //1과 0은 for문까지 갈 필요 없다

  for (int i = 2; i * i <= number; i++) {
    // 2부터 검사하되, 소수를 판별하는 제곱근 알고리즘을 바탕으로, 비교군 수를 줄여 계산시간을 단축해준다.
    // 약수의 대칭성과 소수가 아닌 수가 두 개의 약수를 가지고 작은 약수가 제곱근을 넘지 않는다는 특징을 이용.
    if (number % i == 0) { return false; } // 소수가 아닌 것을 걸러내자!
  }
  return true; // 위 반복문은 소수가 아닌 조건을 검사했으니, 소수가 아닌 수를 발견하지 못하고 for문이 종료되면
   // 자연적으로 true를 리턴하게 된다.
}

void main() {
  print(isPrime(7)); // true가 출력되어야 합니다
  print(isPrime(12)); // false가 출력되어야 합니다
  print(isPrime(23)); // true가 출력되어야 합니다
}