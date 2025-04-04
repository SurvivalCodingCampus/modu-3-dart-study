import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-13/hero.dart';
import 'package:modu_3_dart_study/2025-03-18/greatWizard.dart';

void main() {
  test('슈퍼 힐을 시전할 때 마나가 충분한 경우', () {
    Hero hero = Hero(name: '홍길동', hp: 50);
    GreatWizard wizard = GreatWizard('간달프');

    // 첫 번째 슈퍼 힐
    wizard.superHeal(hero);

    expect(hero.hp, equals(hero.maxHp));  // hero의 HP가 maxHp로 회복됨
    expect(wizard.mp, equals(100));  // wizard의 MP는 50만큼 소모되어 100이어야 함
  });

  test('슈퍼 힐을 시전할 때 마나가 부족한 경우', () {
    Hero hero = Hero(name: '홍길동', hp: 50);
    GreatWizard wizard = GreatWizard('간달프');

    // 첫 번째 슈퍼 힐
    wizard.superHeal(hero);
    
    // 두 번째 슈퍼 힐 (마나 부족)
    wizard.superHeal(hero);

    // 세 번째 슈퍼 힐 (마나 부족)
    wizard.superHeal(hero);

    expect(hero.hp, equals(hero.maxHp));  // 첫 번째 슈퍼 힐 후 HP는 maxHp로 회복
    expect(wizard.mp, equals(50));  // MP는 150에서 50만큼 소모되어 50
  });

  test('슈퍼 힐을 시전할 때 마나가 부족할 때 출력 확인', () {
    Hero hero = Hero(name: '홍길동', hp: 50);
    GreatWizard wizard = GreatWizard('소라카');
    
    wizard.superHeal(hero); // 첫 번째 힐
    wizard.superHeal(hero); // 두 번째 힐
    wizard.superHeal(hero); // 세 번째 힐

    expect(wizard.mp, equals(0));  // MP가 50 남아 있어야 함
  });
}