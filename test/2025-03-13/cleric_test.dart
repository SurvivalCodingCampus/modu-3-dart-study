import 'package:modu_3_dart_study/2025-03-13/exercise.dart';
import 'package:test/test.dart';

void main() {
  test('cleric prey', () {
    final cleric = Cleric('prey', 50, 0);

    expect(cleric.pray(1), lessThan(3));
    expect(cleric.pray(2), lessThan(5));
    expect(cleric.pray(3), lessThan(6));
    expect(cleric.pray(3), greaterThan(2));
  });
}
