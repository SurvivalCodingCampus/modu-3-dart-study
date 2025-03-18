import 'dart:math';

import 'package:modu_3_dart_study/2025-03-17/wand.dart';
import 'package:modu_3_dart_study/2025-03-17/wizard.dart';
import 'package:test/test.dart';

void main() {
  Random random = Random();

  const String wizardTwoLengthName = '법사';
  const String wizardNormalName = '마법사';
  const String normalName = '지팡이';

  double nomalRandomPower = 0.5 + random.nextDouble() * 99;
  double negativeDouble = -1.0 * (random.nextDouble() * 9.0 + 1.0);

  Wand normalWand = Wand(name: normalName, power: nomalRandomPower);
  Wand errorWand = Wand(name: wizardTwoLengthName, power: nomalRandomPower);

  Wizard normalWizard = Wizard(
    name: wizardNormalName,
    hp: Random().nextInt(100),
    // mp: Random().nextInt(100),
    wand: normalWand,
  );

  test("마법사 이름 유효성 검사", () {
    expect(
      () => (Wizard(
        name: wizardTwoLengthName,
        hp: Random().nextInt(100),
        // mp: Random().nextInt(100),
        wand: normalWand,
      )),
      throwsA(isA<Exception>()),
    );

    expect(normalWizard.name, equals(wizardNormalName));
  });

  test("마법사 hp 유효성 검사", () {
    Wizard hpZeroWizard = Wizard(
      name: wizardNormalName,
      hp: -1 * (random.nextInt(1) * 9 + 1),
      // mp: Random().nextInt(100),
      wand: normalWand,
    );

    expect(hpZeroWizard.hp, equals(0));
  });

  test("마법사 mp 유효성 검사", () {
    expect(
      () => (Wizard(
        name: wizardNormalName,
        hp: Random().nextInt(100),
        // mp: -1 * (random.nextInt(1) * 9 + 1),
        wand: normalWand,
      )),
      throwsA(isA<Exception>()),
    );
  });

  test("마법사 지팡이 유효성", () {
    expect(
      () => (Wizard(
        name: wizardNormalName,
        hp: Random().nextInt(100),
        // mp: -1 * (random.nextInt(1) * 9 + 1),
        wand: errorWand,
      )),
      throwsA(isA<Exception>()),
    );
  });
}
