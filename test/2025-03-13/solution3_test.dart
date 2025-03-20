import 'package:modu_3_dart_study/2025-03-13/solution3.dart';
import 'package:test/test.dart';

void main() {
  group('Cleric', () {
    // 준비(Arrange)
    late Cleric cleric;

    test('Cleric selfAid 테스트', () {
      // 준비(Arrange)
      cleric = Cleric('Sally');

      // 실행(Act)
      cleric.selfAid();

      // 검증(Assert)
      expect(cleric.mp, equals(5));
    });

    test('Cleric pray 테스트', () {
      cleric = Cleric('John');

      cleric.pray(0);

      expect(cleric.mp, equals(10));
    });
  });
}