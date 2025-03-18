

import 'package:test/test.dart';

import '../../assignments/25-03-13/cleric.dart';



void main() {
  test('Cleric Tset', () {
    //given
    final cleric = Cleric('성자', 50 , 10);


    // when (실행)
    cleric.selfAid();

    // then 검증
    expect(cleric.hp, equals(50));
  });
}
