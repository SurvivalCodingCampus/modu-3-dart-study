import 'package:test/test.dart';

import '../../../assignments/2025_03_19/solution1/book.dart';
import '../../../assignments/2025_03_19/solution1/computer.dart';

void main() {
  group('Tangible Asset', () {
    final book = Book(
      isbn: 'isbn',
      name: '보카',
      color: '노란색',
      price: 9800,
      weight: 500,
    );

    final computer = Computer(
      makerName: 'LG',
      name: '그램',
      color: '흰색',
      price: 1000000,
      weight: 2000,
    );
    test('최상위 Asset 의 field 를 가지고 있는지 확인', () {
      // isbn 빼고는 모두 부모 클래스가 가지고 있는 field
      expect(book.name, equals('보카'));
      expect(book.color, equals('노란색'));
      expect(book.price, equals(9800));
    });

    test('interface 의 getter, setter 사용', () {
      // TangibleAsset 이 implements 하고 있는 Thing 의 getter 와 setter 를 사용한 결과 값
      expect(computer.weight, 2000);
    });
  });
}
