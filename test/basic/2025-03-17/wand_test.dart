import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../../assignments/basic/2025-03-17/wand.dart';

void main() {
  // ----- Constructor -----
  group("Wand 생성자 유효성 검사 테스트", () {
    test("Wand 생성자에서 이름 유효성 검사 테스트", () {
      Wand wand = Wand("마", 20);

      expect(wand, isA<Wand>());
    });

    test("Wand 생성자에서 마력 유효성 검사 테스트", () {
      Wand wand = Wand("마력의 지팡이", 0.1);

      expect(wand, isA<Wand>());
    });
  });

  // ----- setter -----
  group("Wand setter 유효성 검사 테스트", () {
    test("Wand setter에서 이름 유효성 검사 테스트", () {
      // given
      Wand wand = Wand("마력의 지팡이", 20);

      // when
      wand.name = "마";
    });

    test("Wand setter에서 마력 유효성 검사 테스트", () {
      // given
      Wand wand = Wand("마력의 지팡이", 20);

      wand.power = 0.1;
    });
  });
}
