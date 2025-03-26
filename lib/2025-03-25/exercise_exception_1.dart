// 다음과 같은 코드를 작성, 실행 후 runtime error 를 발생하시오

void main() {
  final numString = '10.5';

  try {
    int num = int.parse(numString);
    print(num);
  } catch (e) {
    int num = 0;
    print(num);
  }
}