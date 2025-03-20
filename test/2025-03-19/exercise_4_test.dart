import 'package:modu_3_dart_study/2025-03-19/exercise_4.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  Computer computer = Computer('갠역시', 10000, 'black', 100, '삼성');
  computer.weight = 10;

  test('computer', () {
    expect(computer.name, '갠역시');
    expect(computer.price, 10000);
    expect(computer.color, 'black');
    expect(computer.size, 100);
    expect(computer.makeName, '삼성');
    expect(computer.weight, 10);
  });
}
