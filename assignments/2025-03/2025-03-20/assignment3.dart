import 'assignment2.dart';

void main(List<String> args) {
  A classA = A();
  B classB = B();
  List<Y> list = [classA as Y, classB as Y];

  for (final item in list) {
    item.b();
  }
}
