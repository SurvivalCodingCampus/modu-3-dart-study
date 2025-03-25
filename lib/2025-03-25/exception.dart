void main() {
  ExcptionTest1(); // catch 문으로 예외 핸들링
  ExcptionTest2(); // FormatException 문으로 예외 핸들링
}

void ExcptionTest1() {
  final numString = '10.5';
  int num;

  try {
    //FormatException: Invalid radix-10 number (at character 1)
    num = int.parse(numString);
    print('바로 앞에서 터져서 출력이 안되네: $num');
  } catch (e) {
    num = 0;
    print('정수가 아닙니다. catch문에서 num 값 $num 으로 설정합니다.');
    print(e);
  }
}

void ExcptionTest2() {
  final numString = '10.5';
  int num;

  try {
    //FormatException: Invalid radix-10 number (at character 1)
    num = int.parse(numString);
    print(num);
  } on FormatException {
    num = 0;
    print('정수가 아닙니다. FormatException문에서 num 값 $num 으로 설정합니다.');
  }
}
