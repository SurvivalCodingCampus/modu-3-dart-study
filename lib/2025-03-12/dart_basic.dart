void main() {
  print('Hello World');
  print(f(5));  // 10

  // 모든 타입을 담을 수 있는 타입
  // 왠만하면 쓰지 말자
  // 컴파일타임에 타입이 결정 (실행 전)
  Object o = 42;  // int

  // 모든 값을 담을 수 있는 타입 // 런타임 // 절대 금지
  // 절대악
  // 런타임에 타입이 결정 (실행할 때)
  dynamic d = 42;
  dynamic dd = '한글';
  dynamic ddd = f2(5);

  // 타입 추론 var 금지
  String name = 'Voyager I'; // String
  int year = 1977;  // int
  double antennaDiameter = 3.7;
  bool isMarried = true;  // true/false
  List<String> flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];

  for (final object in flybyObjects) {
    print(object);
  }


  print(name.runtimeType);
  print(year.runtimeType);

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  } else {
    print('이도 저도 아니라');
  }

  int result = f2(5);
  result = 10;

  print(result);

  print(f(5));


  // 상수 (값이 한번 결정되면 안 변하는 값), 이거 위주로
  const double pi = 3.14;   // 컴파일타임 상수, 메모리에 자리 잡는다

  final int num = 5;  // 런타임 상수, 사용할 때 메모리에 자리 잡아

  // 변수를 많이 쓰면 버그 발생률이 기하급수적으로 늘어난다
  int age = 10;

  print(10 / 5);   // 2.0 (double 타입)
  print(10 ~/ 5);  // 2 (int 타입)
  print(10 % 5);   // 0 (나머지)
}

// 함수
// y = f(x)
// 10 = f(5)
//        x * 2

// 함수의 정석
int f(int x) {
  return x * 2;
}

// 이거 왜 될까, 하면 안 돼!!
// f2(x) {
//   return x * 2; // '5' * 2
// }