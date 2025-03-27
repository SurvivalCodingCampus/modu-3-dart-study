import 'enum/key_type.dart';
import 'generic/strong_box.dart';

void main() {
  final strongBox1 = StrongBox(element: 'Hi', key: KeyType.padLock);
  final strongBox2 = StrongBox(element: 'Hi', key: KeyType.button);
  final strongBox3 = StrongBox(element: 'Hi', key: KeyType.dial);

  print(strongBox1.get());
  print(strongBox2.get());
  print(strongBox3.get());
}
