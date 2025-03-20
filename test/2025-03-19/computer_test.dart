import 'package:test/test.dart';
import '../../assignments/2025-03-19/computer.dart';

void main() {
  group("유형자산 책(book) 테스트", () {
    final name = "맥";
    final price = 4000000;
    final color = "검정색";
    final makerName = "애플";
    final computer = Computer(
      10,
      name: name,
      price: price,
      color: color,
      makerName: makerName,
    );
    test("생성자 테스트", () {
      expect(computer, isA<Computer>());
      expect(computer.name, equals(name));
      expect(computer.price, equals(price));
      expect(computer.color, equals(color));
      expect(computer.makerName, equals(makerName));
    });

    test("weight setter/getter error 테스트", () {
      expect(() => computer.weight = -5, throwsA(isA<Exception>()));
    });
  });
}
