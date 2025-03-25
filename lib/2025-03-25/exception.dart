void main() {
  final numString = '10.5';

  try {
    int numb = int.parse(numString);
    print("변환된 숫자: $numb");
    // 'on 에러형식' 으로 에러별 처리방식을 구현할 수 있고, catch(e)로 처리시 에러 타입을 잡을 수 있음
  } on FormatException {
    print("0");
  }
}

//try - catch 문으로 사용시 표현 방법
// void main() {
//   final numString = '10.5';
//
//   try {
//     int numb = int.parse(numString);
//     print("변환된 숫자: $numb");
//     // 'on 에러형식' 으로 에러별 처리방식을 구현할 수 있고, catch(e)로 처리시 에러 타입을 잡을 수 있음
//   } catch (e) {
//     print('0');
//   }
// }