abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

void main() {
  A a = A();
  B b = B();

  final List<Y> myList = <Y>[a, b];

  // 리스트의 각 요소에 대해 b() 메소드 호출
  for (var item in myList) {
    item.b();  // A 객체는 "Ab", B 객체는 "Bb"를 출력함
  }


  // 참고: final 변수는 다른 리스트로 변경할 수 없지만, 리스트의 내용은 변경 가능합니다
  // 예: myList.add(new A()); // 가능
  // 예: myList = [new A()]; // 불가능 - 컴파일 오류 발생
}