void main() {
  // [변수]
  // -> 변수가 많아지면 버그가 기하급수적으로 늘어남!
  // var name = 'jilong';
  // var year = 28; // var 금지!!!!! 명확하게 타입 설정하기

  // -> 타입을 명확하게 하자!
  String name = 'jilong';
  int year = 1997;
  double height = 180.7;
  bool ismerry = true;
  List<String> favorites = ['빵', '고양이', '산'];

  print(name.runtimeType);
  print(year.runtimeType);

  // 모든 타입이 가능한 타입(Object, dynamic)
  // -> 왠만하면 쓰지 말것! 특히 dynamic은 절대 금지!
  // - Object
  Object o = '한글';
  Object oo = 42;
  Object ooo = true;
  // - dynamic
  dynamic d = '한글';
  dynamic dd = 42;
  dynamic ddd = true;

  print(f(5)); // 명확한 int 타입지정
  print(f2(5)); // 타입지정안함

  print(10 / 5);
  print(10 ~/ 5);
  /*
    / 연산자는 double을 반환 → 10 / 5는 2.0
    ~/ 연산자를 사용하면 int 반환 → 10 ~/ 5는 2
  */

  //----------------------------
  // [상수]
  //  : 값이 한번 결정되면 안 변화는값
  // -> 상수 위주의 코드를 써야 오류가 적음.
  const double pi = 3.14; // 컴파일 함수, 메모리 자리잡고 선언
  final int num = 5; // 런타임 상수, 사용할 때 메모리

  //----------------------------
  // if 조건문
  if (year >= 2001) {
    print('21세기');
  } else if (year >= 1901) {
    print('20세기');
  } else {
    print('이도저도 아님요!');
  }

  //---------------------------
  //[반복문]
  // for문
  for (int i = 0; i < 5; i++) {
    print(i);
  }

  // while문
  int count = 0;
  while (count < 5) {
    print(count);
    count++;
  }
}

//----------------------------
// [함수]
// 정석함수
int f(int x) {
  return x * 2;
}

// 잘못된 함수
// -> 타입추론에 영향을 받아서
// -> 버그에 원인이됨...
// 그래서, 명확하게 타입을 지정해 줘야함
f2(x) {
  return x * 2;
}
