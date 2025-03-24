import 'package:modu_3_dart_study/2025-03-14/exercise.dart';
import 'package:test/test.dart';

void main() {

  test('cleric prey', () {
    // given(준비)
    Cleric cleric1 = Cleric(name: '아서스', hp: 40, mp: 5);
    Cleric cleric2 = Cleric(name: '아서스', hp: 35);
    Cleric cleric3 = Cleric(name: '아서스');

    // when(실행)
    var clericName1 = cleric1.name;
    var clericHp1 = cleric1.hp;
    var clericMp1 = cleric1.mp;

    var clericName2 = cleric2.name;
    var clericHp2 = cleric2.hp;
    var clericMp2 = cleric2.mp;

    var clericName3 = cleric3.name;
    var clericHp3 = cleric3.hp;
    var clericMp3 = cleric3.mp;


    // then(검증)
    expect(clericName1, equals('아서스'));
    expect(clericHp1, equals(40));
    expect(clericMp1, equals(5));

    expect(clericName2, equals('아서스'));
    expect(clericHp2, equals(35));
    expect(clericMp2, equals(Cleric.maxMp));

    expect(clericName3, equals('아서스'));
    expect(clericHp3, equals(Cleric.maxHp));
    expect(clericMp3, equals(Cleric.maxMp));

  });
}
