import 'package:modu_3_dart_study/2025-03-14/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('group name', () {
    test('cleric Test A', () {
    // Givne(준비)
    final cleric = Cleric('아서스', hp: 40, mp: 5);
    // When(실행)

    // Then(검증)
    expect(cleric.name, '아서스');
    expect(cleric.hp, 40);
    expect(cleric.mp, 5);
  });

  test('cleric Test B', () {
    // Givne(준비)
    final cleric = Cleric('아서스', hp: 35);
    // When(실행)

    // Then(검증)
    expect(cleric.name, '아서스');
    expect(cleric.hp, 35);
    expect(cleric.mp, Cleric.maxMp);
  });

  test('cleric Test C', () {
    // Givne(준비)
    final cleric = Cleric('아서스');
    // When(실행)

    // Then(검증)
    expect(cleric.name, '아서스');
    expect(cleric.hp, Cleric.maxHp);
    expect(cleric.mp, Cleric.maxMp);
  });
  });
  
}