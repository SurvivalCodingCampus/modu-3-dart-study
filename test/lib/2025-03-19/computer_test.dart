import 'package:modu_3_dart_study/2025-03-19/computer.dart';
import 'package:modu_3_dart_study/2025-03-19/tangible_asset.dart';
import 'package:test/test.dart';

void main() {
  test('Computer는 TangibleAsset의 Sub 클래스여야한다.', () {
    // Given
    final Computer computer;

    // When
    computer = Computer(
      name: 'Book',
      color: 'Black',
      price: 1000,
      makerName: 'Apple',
    );

    // Then
    expect(computer, isA<TangibleAsset>());
  });
  test('Computer는 이름과 색상, 컬러, 무게, 생산자 이름을 가져야한다.', () {
    // Given
    final Computer computer;

    // When
    computer = Computer(
      name: 'Book',
      color: 'Black',
      price: 1000,
      makerName: 'Apple',
    );
    // Then
    expect(computer.name, isNot(null));
    expect(computer.price, isNot(null));
    expect(computer.color, isNot(null));
    expect(computer.weight, isNot(null));
    expect(computer.makerName, isNot(null));
  });
  test('Computer의 가격을 음수로 초기화할 경우 0으로 초기화 되어야한다.', () {
    // Given
    final Computer computer;

    // When
    computer = Computer(
      name: 'Book',
      color: 'Black',
      makerName: 'Apple',
      price: -1,
    );

    // Then
    expect(computer.price, equals(0));
  });

  test('Computer는 무게를 세터로 지정할 수 있어야한다.', () {
    // Given
    final Computer computer;

    // When
    computer = Computer(
      name: 'Book',
      color: 'Black',
      makerName: 'Apple',
      price: 1000,
    );
    computer.weight = 1.0;

    // Then
    expect(computer.weight, equals(1.0));
  });
  test('Computer의 무게를 음수로 초기화할 경우 0.0으로 초기화 되어야한다.', () {
    // Given
    final Computer computer;

    // When
    computer = Computer(
      name: 'Book',
      color: 'Black',
      makerName: 'Apple',
      price: 1000,
    );
    computer.weight = -0.1;

    // Then
    expect(computer.weight, equals(0.0));
  });
}
