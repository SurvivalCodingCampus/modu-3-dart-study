import 'package:modu_3_dart_study/2025-03-13/Cleric.dart';
import 'package:test/test.dart';

void main() {
  test('cleric_selfaid', () {
    Cleric cleric = Cleric('최윤석');

    cleric.selfaid();

    expect(cleric.hp, equals(50));
    expect(cleric.mp, equals(5));
  });


  test('cleric_pray', () {
    Cleric cleric = Cleric('최윤석');

    var diff = cleric.pray(3);

    expect(diff, lessThan(11));
  });
}
