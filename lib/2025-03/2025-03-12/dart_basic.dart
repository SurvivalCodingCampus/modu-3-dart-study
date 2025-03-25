void main() {
  print('Hello, World');

  //타입 추론 => var쓰지말고 타입 명시하기.
  var name = 'V'; // String
  var year = 1977; // int

  print(name.runtimeType);
  print(year.runtimeType);

  //조건문
  if (year > 2000) {
    print('21st century');
  }

  // 상수(값이 한번 결정되면 안 변하는 값)
  const double pi =
      3.141592; // 컴파일 타임 상수 // 미리 메모리에 자리 잡음 // 플러터가면 const붙여달라고 많이함.

  final int num = 5; // 런타임 상수 // 사용할 때 메모리에 자리 잡음
  // num = 10; // 불가능
  // 상수가 많은게 좋음. 변수는 어쩔 수 없을때 쓰는거임. // 왜? 변수의 수가 증가할 수록 기하급수적으로 복잡성이 증가. 가능한 상호작용의 수가 엄청나게 늘어남.
  pi + num;

  // /, ~/, %
  print(10 / 5); // 2.0
  print(10 ~/ 5); // 정수 나눗셈
  print(10 % 5); // 5로 나눈 나머지

  //나아중에
  //Object vs dynamic : 모든 값을 담을 수 있는 타입. 웬만하면 금지.
  Object o = 42; //Object : 컴파일 타임(실행전)에 타입이 결정됨.
  // Object oo = '한글';
  // Object ooo = true;

  print(o.runtimeType);
  o = '한글';

  //dynamic : 런타임(실행할 때)시 타입이 결정됨. 사실 다트에 있어서는 안될놈. 근본없음. 일단 사용 금지.
  dynamic d = 42;
  dynamic dd = '한글';
  dynamic ddd = true;

  d = '한글';
  d + dd + ddd; //....
}

// 함수
f(x) {
  return x * 2;
}
//이거 왜 될까? => 근본없는 JS.

// 함수의 정석
int f2(int x) {
  return x * 2;
}
