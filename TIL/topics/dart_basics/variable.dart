/* [변수] */
void main() {
  int n1 = 1;
  double d1 = 10.1;
  bool b1 = true;
  String s1 = "홍길동";

  // 변수값 확인
  print("* 변수값 확인");
  print("정수 : $n1");
  print("실수 : $d1");
  print("부울 : $b1");
  print("문자열 : $s1");

  // 타입확인
  print('\n');
  print("* 타입 확인");
  print("정수 : ${n1.runtimeType}");
  print("실수 : ${d1.runtimeType}");
  print("부울 : ${b1.runtimeType}");
  print("문자열 : ${s1.runtimeType}");

  // 타입추론 (var/dynamic)
  // * var -> 타입 변경 불가능
  var n2 = 1;
  var d2 = 10.1;
  var b2 = true;
  var s2 = "홍길동";
  // n2 = 10.5; // 오류남
  print('\n');
  print("* 타입 추론 (var)");
  print("정수 : ${n2.runtimeType}");
  print("실수 : ${d2.runtimeType}");
  print("부울 : ${b2.runtimeType}");
  print("문자열 : ${s2.runtimeType}");

  // * dynamic -> 값변경 가능
  dynamic n3 = 1;
  print('\n');
  print("* 타입 추론 (dynamic)");
  print("n3의 타입 변경 전: ${n3.runtimeType}");
  n3 = 10.1;
  print("n3의 타입 변경 후: ${n3.runtimeType}");
}
