//주어진 숫자가 소수 인지 확인 하는 함수를 작성 하세요.
bool isPrime(int number){
  //for 문과 if 문을 사용 하여 구현 하세요.
  for (int i=2; i<number; i++){
    if(number % i == 0){
      return false;
    }

  }
  return true;

  }

void main() {
  print(isPrime(7));    // true가 출력되어야 합니다.
  print(isPrime(12));   // false가 출력되어야 합니다.
  print(isPrime(23));   // true가 출력되어야 합니다.

}