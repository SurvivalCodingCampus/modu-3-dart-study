import 'a.dart';
import 'y.dart';

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
  List<Y> y = [
    A(),
    B()
  ];

  for (final y in y) {
    y.b();
  }
}