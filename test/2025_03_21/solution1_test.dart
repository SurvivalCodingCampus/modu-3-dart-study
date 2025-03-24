import 'package:test/test.dart';

import '../../assignments/2025_03_21/book.dart';

void main() {
  Book book1 = Book(title: '개발', comment: '인스턴스');
  Book book2 = Book(title: '개발', comment: '추상클래스');
  group('Book', () {
    test('제목과 출간일이 같으면 같은 책이다.', () {
      expect(book1 == book2, isTrue);
    });
    test('신상 출간일 순서대로 정렬', () {
      List bookList = <Book>[];

      bookList.add(book1);
      bookList.add(book2);

      print(bookList);
    });
    test('copyWith() 메서드', () {
      Book book3 = book1.copyWith();

      expect(book1 == book3, isTrue);
      print(book3);
    });
  });
}
