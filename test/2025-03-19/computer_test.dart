import 'package:test/test.dart';
import '../../assignments/2025-03-19/computer.dart';

void main() {
  group("유형자산 책(book) 테스트", () {
    final name = "맥";
    final price = 4000000;
    final color = "검정색";
    final isbn = "SN1234567890";
    final computer = Computer(
      10,
      name: name,
      price: price,
      color: color,
      isbn: isbn,
    );
    test("생성자 테스트", () {
      expect(computer, isA<Computer>());
      expect(computer.name, computer.name);
      expect(computer.price, computer.price);
      expect(computer.color, computer.color);
      expect(computer.isbn, computer.isbn);
    });

    test("weight setter/getter error 테스트", () {
      expect(() => computer.weight = -5, throwsA(isA<Exception>()));
    });
  });
}
