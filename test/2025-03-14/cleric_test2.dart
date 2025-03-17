
import 'package:modu_3_dart_study/2025-03-14/cleric2.dart';
import 'package:test/test.dart';



void main() {
  test('Cleric1 Test', () {

    final Cleric clericA;

    clericA = Cleric('아서스', hp : 40, mp : 5);

    // clericA 가 Cleric의 인스턴스인지 확인
    expect(clericA, isA<Cleric>());
    expect(clericA.hp, equals(40));
    expect(clericA.mp, equals(5));

  });
  test('Cleric2 Test', () {

    final Cleric clericB;

    clericB = Cleric('아서스', hp : 35);

    expect(clericB, isA<Cleric>());
    expect(clericB.hp, equals(35));
    expect(clericB.mp, equals(Cleric.maxMp));

  });
  test('Cleric3 Test', () {

    final Cleric clericC;


    clericC = Cleric('아서스');


    expect(clericC, isA<Cleric>());
    expect(clericC.hp, equals(Cleric.maxHp));
    expect(clericC.mp, equals(Cleric.maxMp));


  });

}