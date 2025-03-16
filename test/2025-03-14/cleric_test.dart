
import 'package:test/test.dart';
import '../../assignments/2025-03-14/cleric.dart';

void main() {

  const String name = '아서스';
  const int maxHp = 50;
  const int maxMp = 10;

  test("Cleric('아서스', hp:40, mp:5) 생성자 테스트", () {

    // given(준비)
    final int givenHp = 40;
    final int givenMp = 5;
    final cleric = Cleric(name, hp:givenHp, mp:givenMp);

    // when(실행)

    // then(검증)
    expect(cleric.name, equals(name));
    expect(cleric.hp, equals(givenHp));
    expect(cleric.mp, equals(givenMp));

  });

  test("Cleric('아서스', hp:35) 생성자 테스트", () {

    // given(준비)
    final int givenHp = 35;
    final cleric = Cleric(name, hp:givenHp);

    // when(실행)

    // then(검증)
    expect(cleric.name, equals(name));
    expect(cleric.hp, equals(givenHp));
    expect(cleric.mp, equals(maxMp));
  });

  test("Cleric('아서스') 생성자 테스트", () {

    // given(준비)
    final cleric = Cleric(name);

    // when(실행)

    // then(검증)
    expect(cleric.name, equals(name));
    expect(cleric.hp, equals(maxHp));
    expect(cleric.mp, equals(maxMp));
  });

  test("Cleric('아서스') 생성자 테스트", () {

    // given(준비)
    //final cleric = Cleric();   //에러남.

    // when(실행)

    // then(검증)
   });
}
