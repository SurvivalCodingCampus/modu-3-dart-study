/* [함수] 
    * 구구단 출력 프로그램
*/

void gugudan(int num) {
  print("${num} 단");
  print("${num} * 1 = ${num * 1}");
  print("${num} * 2 = ${num * 2}");
  print("${num} * 3 = ${num * 3}");
  print("${num} * 4 = ${num * 4}");
  print("${num} * 5 = ${num * 5}");
  print("${num} * 6 = ${num * 6}");
  print("${num} * 7 = ${num * 7}");
  print("${num} * 8 = ${num * 8}");
  print("${num} * 9 = ${num * 9}");
}

void add(int n1, int n2) {
  print('더하기');
  print(n1 + n2);
}

// 람다식 표현
void add2(int n3) => n3 + 1;

void main() {
  gugudan(4); // 구구단

  print('\n');
  add(1, 3); // 더하기
  add2(3); // 람다식 표현
}
