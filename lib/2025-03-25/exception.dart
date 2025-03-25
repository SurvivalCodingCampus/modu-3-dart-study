void main() {

  ExcptionTest1();
  ExcptionTest2();
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
    print('정수가 아닙니다:\n$e');
    print('catch문에서 num 값 $num 으로 셋팅');
    print('-----------------------');
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
    print("정수가 아닙니다, 기본값을 0으로 사용해야합니다.");
    print('FormatException 문에서 num 값 $num 으로 셋팅');
  }
}
