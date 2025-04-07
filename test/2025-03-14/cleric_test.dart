import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-03-14/cleric.dart';

void main() {
  test('기본생성자 테스트1', () {
    Cleric cleric = Cleric('아서스', hp: 40, mp: 5);

    expect(cleric.name, equals('아서스'));
    expect(cleric.hp, equals(40));
    expect(cleric.mp, equals(5));
  });

  test('기본생성자 테스트2', () {
    Cleric cleric = Cleric('아서스', hp: 35);

    expect(cleric.name, equals('아서스'));
    expect(cleric.hp, equals(35));
    expect(cleric.mp, equals(Cleric.maxMp));
  });

  test('기본생성자 테스트3', () {
    Cleric cleric = Cleric('아서스');

    expect(cleric.name, equals('아서스'));
    expect(cleric.mp, equals(Cleric.maxMp));
    expect(cleric.hp, equals(Cleric.maxHp));
  });

  // test('네임드 생성자 withNameAndHp 테스트', () {
  //   Cleric cleric = Cleric.withNameAndHp('아서스', 35);

  //   expect(cleric.name, equals('아서스'));
  //   expect(cleric.hp, equals(cleric.hp));
  //   expect(cleric.mp, equals(Cleric.maxMp));
  // });

  // test('네임드 생성자 withName 테스트', () {
  //   Cleric cleric = Cleric.withName('아서스');

  //   expect(cleric.name, equals('아서스'));
  //   expect(cleric.hp, equals(Cleric.maxHp));
  //   expect(cleric.mp, equals(Cleric.maxMp));
  // });
}
