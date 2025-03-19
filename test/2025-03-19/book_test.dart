import 'package:test/test.dart';
import '../../assignments/2025-03-19/book.dart';

void main() {
  group("유형자산 책(book) 테스트", () {
    final name = "그리고 아무도 없었다";
    final price = 25000;
    final color = "빨간색";
    final makerName = "애거서 크리스티";
    final book = Book(
      10,
      name: name,
      price: price,
      color: color,
      makerName: makerName,
    );
    test("생성자 테스트", () {
      expect(book, isA<Book>());
      expect(book.name, book.name);
      expect(book.price, book.price);
      expect(book.color, book.color);
      expect(book.makerName, book.makerName);
    });

    test("weight setter/getter error 테스트", () {
      expect(() => book.weight = -5, throwsA(isA<Exception>()));
    });
  });
}
