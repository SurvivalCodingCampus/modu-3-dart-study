/* [연산자] 
    * 산술연산자 
    * 비교연산자 
    * 논리연산자
*/
void main() {
  print("[연산자]");
  print('\n');
  print("1. 산술연산자");
  // 더하기
  print("3 + 2= ${3 + 2}");
  // 빼기
  print("3 - 2= ${3 - 2}");
  // 곱하기
  print("3 * 2= ${3 * 2}");
  // 나누기
  print("3 / 2= ${3 / 2}");
  // 나머지
  print("3 % 2= ${3 % 2}");
  // 몫 구하기
  print("3 ~/ 2= ${3 ~/ 2}");

  print('\n');
  print("2. 비교연산자");
  // 같다
  print("2 == 3 -> ${2 == 3}");
  // 다르다
  print("2 != 3 -> ${2 != 3}");
  // 왼쪽 값 보다 크다
  print("2 < 3 -> ${2 < 3}");
  // 왼쪽 값 보다 작다
  print("2 > 3 -> ${2 > 3}");
  // 왼쪽 값 보다 크거나 같다
  print("2 <= 3 -> ${2 <= 3}");
  // 왼쪽 값 보다 작거나 같다
  print("2 >= 3 -> ${2 >= 3}");

  print('\n');
  print("3. 논리연산자");
  // 부정
  print("!true -> ${!true}");
  // 그리고
  print("true && false -> ${true && false}");
  print("true && true -> ${true && true}");
  // 또는
  print("true || false -> ${true || false}");
}
