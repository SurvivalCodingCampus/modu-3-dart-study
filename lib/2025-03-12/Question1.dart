void main() {

  print(sumOfMultiples(10)); //23
  print(sumOfMultiples(20)); //78
  print(sumOfMultiples(31)); //78

}

// 주어진 범위 내에서 3의 배수 또는 5의 배수인 모든 숫자의 합을 구하는 함수를 작성하세요.
int sumOfMultiples(int limit) {
  //for문과 if 문을 사용하여 구현하세요.

  //변수선언
  int sum = 0;               //총합계
  String expression = '';    //식


  // 3의 배수를 찾는다. 3으로 나눈 나머지 0
  // 5의 배수를 찾는다. 5로 나눈 나머지 0
  // 3의 배수와 5의 배수의 값이 같으면 (예:30) 한번만 더한다.

  for (int i=1; i< limit; i++) {
    if(i%3 == 0){
      sum = sum + i;
      expression = expression + i.toString() + ' + ';
    }else if (i%5 == 0){
      sum = sum + i;
      expression = expression + i.toString() + ' + ';
    }

  }
  expression = expression + ' = ';
  print(expression);

  return sum;
}


//함수
//