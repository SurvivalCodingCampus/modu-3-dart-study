import 'package:test/test.dart';
import '../../../assignments/basic/2025-03-19/book.dart';

void main() {
  group("유형자산 책(book) 테스트", () {
    final name = "그리고 아무도 없었다";
    final price = 25000;
    final color = "빨간색";
    final isbn = "1231231231";
    final book = Book(10, name: name, price: price, color: color, isbn: isbn);
    test("생성자 테스트", () {
      expect(book, isA<Book>());
      expect(book.name, equals(name));
      expect(book.price, equals(price));
      expect(book.color, equals(color));
      expect(book.isbn, equals(isbn));
    });

    test("weight setter/getter error 테스트", () {
      expect(() => book.weight = -5, throwsA(isA<Exception>()));
    });
  });
}
