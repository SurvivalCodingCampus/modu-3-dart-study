import 'package:modu_3_dart_study/2025-03-14/elegant_cleric.dart';

import 'package:test/test.dart';

void main() {
  group('Cleric Constructor 테스트', () {
    test('Cleric - 변수 체크', () {
      const name = 'Sally';

      final sally = Cleric('Sally', mp: 1);

      expect(sally.hp, equals(50));
      expect(sally.name, equals(name));
    });

    test('Cleric - 잘못된 HP 할당', () {
      const name = 'Tom';

      final tom = Cleric(name, mp: 1);

      expect(tom.hp, equals(50));
    });

    test('Cleric - MP 테스트', () {
      const name = 'John';
      const mp = 0;

      final john = Cleric(name, mp: mp);
      john.selfAid();
      john.pray(1);

      expect(john.mp, lessThan(5));
    });

    test('Cleric - 정적변수 테스트', () {
      var maxHp = Cleric.maxHp;
      var maxMp = Cleric.maxMp;

      expect(maxHp, 50);
      expect(maxMp, 10);
    });
  });
}
