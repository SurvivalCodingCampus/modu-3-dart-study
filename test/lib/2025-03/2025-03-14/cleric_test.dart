import 'package:modu_3_dart_study/2025-03/2025-03-14/cleric.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Cleric("아서스", hp: 40, mp: 5)와 같이, Named Parameter를 이용하여 인스턴스화 할 수 있어야 한다.',
    () {
      // GIVEN
      final Cleric cleric;

      // WHEN
      cleric = Cleric('아서스', hp: 40, mp: 5);

      // THEN
      expect(cleric, isA<Cleric>());
      expect(cleric.hp, equals(40));
      expect(cleric.mp, equals(5));
    },
  );
  test(
    'Cleric(“아서스", hp: 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다. 이 때, MP는 최대 MP와 같은 값이 초기화 되야 한다.',
    () {
      // GIVEN
      final Cleric cleric;

      // WHEN
      cleric = Cleric('아서스', hp: 35);

      // THEN
      expect(cleric, isA<Cleric>());
      expect(cleric.hp, equals(35));
      expect(cleric.mp, equals(Cleric.maxMp));
    },
  );
  test(
    'Cleric("아서스") 와 같이, 이름만을 지정하여 인스턴스화 할 수 있다. 이 때, HP와 MP는 최대 HP와 최대 MP로 초기화 되야 한다.',
    () {
      // GIVEN
      final Cleric cleric;

      // WHEN
      cleric = Cleric('아서스');

      // THEN
      expect(cleric, isA<Cleric>());
      expect(cleric.hp, equals(Cleric.maxHp));
      expect(cleric.mp, equals(Cleric.maxMp));
    },
  );
}
