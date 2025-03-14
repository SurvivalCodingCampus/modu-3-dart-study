import 'package:test/test.dart';

class Cleric {
  String name;
  int? hp;
  int? mp;

  //static const 를 활용해 maxHp,maxMp 공유
  static const int maxHp = 50;
  static const int maxMp = 10;

  //Cleric({required this.name, this.hp = maxHp, this.mp = maxMp});
  //다른방법
  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});
}

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
