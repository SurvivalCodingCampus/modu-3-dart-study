import 'package:modu_3_dart_study/2025-03-13/cleric.dart';
import 'package:test/test.dart';

void main() {
  // test('cleric prey', () {
  //   // given(준비)
  //   final cleric = Cleric('prey', 50, 0);
  //
  //   // when(실행)
  //   int result1 = cleric.prey(1);
  //   int result2 = cleric.prey(2);
  //   int result3 = cleric.prey(3);
  //
  //   // then(검증)
  //   expect(result1, lessThan(11));
  //   expect(result2, lessThan(11));
  //   expect(result3, lessThan(11));
  // });

  test('cleric prey', () {
    // given(준비)
    final cleric = Cleric('prey', 50, 0);

    // when(실행)
    int result1 = cleric.prey(1);
    int result2 = cleric.prey(2);
    int result3 = cleric.prey(3);

    // then(검증)
    expect(result1, inInclusiveRange(0,2));
    expect(result2, inInclusiveRange(0,4));
    expect(result3, inInclusiveRange(3,5));

  });
}
