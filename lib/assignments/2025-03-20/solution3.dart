import 'a.dart';
import 'b.dart';
import 'y.dart';

void main() {
  List<Y> list = [];
  list.add(A());
  list.add(B());

  for (var item in list) {
    item.b();
  }
}
