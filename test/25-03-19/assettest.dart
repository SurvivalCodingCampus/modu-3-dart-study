import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-19/asset.dart';

void main() {
  group('asset test', () {
    test('book의 무게는 50, 세금은 1%다', () {
      Book book = Book(
        '오만과편견',
        '2025',
        '총무팀',
        '공용책',
        20000,
        'blue',
        DateTime(2025, 01, 01),
        '12345678',
      );
      expect(book.weight, equals(50));
      expect(book.calculateTax(), equals(200)); // 20000의 1%는 200
      expect(book, isA<TangibleAsset>());
      expect(book, isA<Asset>());
    });

    test('Computer의 무게는 100, 세금은 8%다 ', () {
      Computer computer = Computer(
        'macbook',
        '2025',
        '총무팀',
        '업무용노트북',
        200000,
        'spacegray',
        DateTime(2025, 01, 01),
        'APPLE',
      );

      expect(computer.weight, equals(100));
      expect(computer.calculateTax(), equals(16000));
      expect(computer, isA<TangibleAsset>());
      expect(computer, isA<Asset>());
    });
  });
}
