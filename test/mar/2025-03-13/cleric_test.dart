import '../../../lib/mar/2025-03-13/cleric.dart';
import 'package:test/test.dart';



void main() {
  test('Cleric Test', () {
    // final cleric = Cleric('crow',  20, 6);

    final cleric = Cleric('crow');

    cleric.selfAid();
    cleric.pray(2);
    
    expect(cleric.hp, equals(cleric.max_hp));
    expect(cleric.mp, greaterThanOrEqualTo(3));
    expect(cleric.mp, lessThanOrEqualTo(10));
    // expect(cleric.mp, inInclusiveRange(3,10));

  });
}