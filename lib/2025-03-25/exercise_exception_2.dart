// 연습 1 에서 작성한 코드를 수정하여,
// try-catch() 문을 사용하여 예외처리를 하시오. 예외처리에는 다음의 처리를 수행하시오.
// 예외가 발생하면 0으로 처리

void main() {
  final numString = '10.5';
  int num;

  try {
    num = int.parse(numString);
    print(num);
  } catch (e) {
    num = 0;
    print(num);
  }
  print(num);
}
