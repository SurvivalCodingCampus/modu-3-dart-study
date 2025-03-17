import 'package:test/test.dart';

import '../../../../assignments/2025-03-17/src/solution/wand.dart';

void main() {
  test('Wand 테스트 - 0.5~100.0 이외의 값을 준 경우', () {
    // given
    Wand wand = Wand(name: '지팡이', power: 100.0);

    // when
    wand.power = 1000.0;

    // then
    expect(wand.name, equals('지팡이'));
    expect(wand.power, equals(1000.0));
  });
}
