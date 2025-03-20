abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

abstract interface class Alphabet {
  void b() {}
}

class A extends Y implements Alphabet {
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

class B extends Y implements Alphabet {
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
