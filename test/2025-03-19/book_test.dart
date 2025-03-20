import 'package:modu_3_dart_study/2025-03-19/book.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final String name = '윤석';
  final int price = 100;
  final String isbn = '1234567890';
  final String color = '검정';
  final double weight = 100.0;
  final double testWeight = 500.0;

  group("Book", () {
    test("Book 생성", (){
      Book book = Book(name: name, price: price, color: color, isbn: isbn, weight: weight);

      expect(book, isA<Book>());
      expect(book.name, equals(name));
      expect(book.price, equals(price));
      expect(book.isbn, equals(isbn));
      expect(book.color, equals(color));
      expect(book.weight, equals(weight));
    });

    test("Book 무게", (){
      Book book = Book(name: name, price: price, color: color, isbn: isbn, weight: weight);

      //setter
      book.weight = testWeight;

      expect(book, isA<Book>());
      expect(book.name, equals(name));
      expect(book.price, equals(price));
      expect(book.isbn, equals(isbn));
      expect(book.color, equals(color));
      expect(book.weight, equals(testWeight));
    });

  });
}