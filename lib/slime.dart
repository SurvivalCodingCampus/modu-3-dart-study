import 'package:test/test.dart';
import '../../assignments/2025-03-13/2025-03-13.dart';

void main() {
  test('Cleric test', () {
    final Cleric = Cleric('성직자', 50, 10);

    expect(Cleric.hp, equals(50));

    expect(Cleric.mp, equals(10));
  });
}