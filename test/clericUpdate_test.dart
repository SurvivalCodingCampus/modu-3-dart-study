import 'package:modu_3_dart_study/PR2025-03-14/clericUpdate.dart';
import 'package:test/test.dart';

void main() {
  test('hp와 mp 모두 지정했을때 Test', () {
    //given(준비)
    final cleric1 = Cleric('아서스', hp: 40, mp: 5);
    //when(실행)

    //then(검증)
    expect(cleric1.hp, equals(40));
    expect(cleric1.mp, equals(5));
  });

  test('hp만 지정하면 mp는 maxMp로 자동 지정 Test', () {
    //given(준비)
    final cleric2 = Cleric('아서스', hp: 35);
    //when(실행)

    //then(검증)
    expect(cleric2.hp, equals(35));
    expect(cleric2.mp, equals(Cleric.maxMp));
  });

  test('mp와hp지정 안해두면 자동으로 maxHP,max Test', () {
    //given(준비)
    final cleric3 = Cleric('아서스');
    //when(실행)

    //then(검증)
    expect(cleric3.hp, equals(Cleric.maxHp));
    expect(cleric3.mp, equals(Cleric.maxMp));
  });
}
