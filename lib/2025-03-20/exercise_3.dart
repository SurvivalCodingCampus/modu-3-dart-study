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

abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

// 1. 둘은 List Y 를 implements 하기 때문에 변수의 타입을 Y 로 해야합니다.

void main() {
  Y a = A();
  Y b = B();


  List<Y> list = [a, b];

  list.forEach((item) {
    item.a();
    item.b();
  });
}
