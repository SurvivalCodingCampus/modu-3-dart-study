import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../assignments/2025-03-17/wand.dart';
import '../../assignments/2025-03-17/wizard.dart';

void main() {
  // ----- Constructor -----
  group("Wizard 테스트", () {
    test("Wizard 생성자에서 이름 유효성 검사 테스트", () {
      final wand = Wand("마력의 지팡이", 50);
      Wizard wizard = Wizard("마", 100, 100, wand);

      expect(wand, isA<Wand>());
      expect(wizard, isA<Wizard>());
    });

    test("Wizard 생성자에서 mp 유효성 검사 테스트", () {
      final wand = Wand("마력의 지팡이", 50);
      Wizard wizard = Wizard("마법사", 100, -1, wand);

      expect(wand, isA<Wand>());
      expect(wizard, isA<Wizard>());
    });

    test("Wizard 생성자에서 hp 검사 테스트", () {
      // given
      final wand = Wand("마력의 지팡이", 50);
      Wizard wizard = Wizard("마법사", -5, 100, wand);

      // then
      expect(wizard.hp, Wizard.minimumHp);
    });
  });

  // ----- setter -----

  group("Wizard setter 테스트", () {
    test("Wizard setter에서 hp 검사 테스트", () {
      // given
      final wand = Wand("마력의 지팡이", 50);
      Wizard wizard = Wizard("마법사", 100, 100, wand);

      // when
      wizard.hp = -100;

      // then
      expect(wizard.hp, Wizard.minimumHp);
    });

    test("Wizard setter에서 mp 유효성 검사 테스트", () {
      // given
      final wand = Wand("마력의 지팡이", 50);
      Wizard wizard = Wizard("마법사", 100, 100, wand);

      // when
      wizard.mp = -5;
    });

    test("Wizard setter에서 Wand의 값 null 검사 테스트", () {
      // given
      Wizard wizard = Wizard("마법사", 100, 100, null);

      // given
      expect(wizard.wand, null);
    });

    test("Wizard setter에서 Wand 검사 테스트", () {
      // given
      final wand = Wand("마력의 지팡이", 50);
      Wizard wizard = Wizard("마법사", 100, 100, wand);

      // when
      wizard.wand = null;

      // given
      expect(wizard.wand, wand);
    });
  });
}
