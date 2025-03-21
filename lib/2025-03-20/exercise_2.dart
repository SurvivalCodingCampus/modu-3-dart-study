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

// 1. 메서드 a(), 호출 : 'Aa'
// 2. y1 = Aa, y2 = Ba
