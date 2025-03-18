import 'dart:math';

import 'package:modu_3_dart_study/2025-03-17/wand.dart';
import 'package:test/test.dart';

void main() {
  test("지팡이 이름 유효성 검사", () {
    const String twoLengthName = '법사';
    const String normalName = '지팡이';

    Random random = Random();

    double minUnderRandomPower = random.nextDouble() * 0.5;
    double nomalRandomPower = 0.5 + random.nextDouble() * 99;
    double maxUpRandomPower = 100 + random.nextDouble() * 50;

    Wand normalWand = Wand(name: normalName, power: nomalRandomPower);

    expect(
      () => Wand(name: twoLengthName, power: nomalRandomPower),
      throwsA(isA<Exception>()),
    );
    expect(
      () => Wand(name: normalName, power: minUnderRandomPower),
      throwsA(isA<Exception>()),
    );
    expect(
      () => Wand(name: normalName, power: maxUpRandomPower),
      throwsA(isA<Exception>()),
    );

    expect(normalWand.name, equals(normalName));
    expect(normalWand.power, equals(nomalRandomPower));
  });
}
