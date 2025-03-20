import 'package:test/test.dart';

import '../../assignments/2025-03-19/computer.dart';

void main() {
  const String computerName = 'MacBook';
  const int computerPrice = 3000000;
  const String computerColor = 'space gray';
  const double computerWeight = 800;
  const String computerMakeName = 'Apple';

  group('컴퓨터 : ', () {
    test('완벽 생성', () {
      // given
      Computer computer = Computer(
        name: computerName,
        price: computerPrice,
        color: computerColor,
        weight: computerWeight,
        makerName: computerMakeName,
      );

      // then
      expect(computer, isA<Computer>());
      expect(computer.name, equals(computerName));
      expect(computer.price, equals(computerPrice));
      expect(computer.color, equals(computerColor));
      expect(computer.weight, equals(computerWeight));
      expect(computer.makerName, equals(computerMakeName));
    });

    test('무게 조절', () {
      // given
      const double computerTestWeight = computerWeight + 200;
      Computer computer = Computer(
        name: computerName,
        price: computerPrice,
        color: computerColor,
        weight: computerWeight,
        makerName: computerMakeName,
      );

      // when
      computer.weight = computerTestWeight;

      // then
      expect(computer, isA<Computer>());
      expect(computer.name, equals(computerName));
      expect(computer.price, equals(computerPrice));
      expect(computer.color, equals(computerColor));
      expect(computer.weight, equals(computerTestWeight));
      expect(computer.makerName, equals(computerMakeName));
    });
  });
}
