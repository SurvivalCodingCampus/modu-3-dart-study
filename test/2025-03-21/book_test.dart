import 'package:test/test.dart';
import '../../assignments/2025-03-21/book.dart';

void main() {
  group('Book 클래스 테스트', () {
    test('제목과 출간일이 같으면 같은 책으로 판단', () {
      Book book1 = Book(title: 'Dart Basics', comment: 'Good book', publishDate: DateTime(2024, 01, 01));
      Book book2 = Book(title: 'Dart Basics', comment: 'Different comment', publishDate: DateTime(2024, 01, 01));

      expect(book1, equals(book2)); // == 연산자가 기대대로 동작하는지 확인
    });

    test('책 리스트를 출간일 기준 최신순 정렬', () {
      List<Book> books = [
        Book(title: 'Old Book', comment: 'Very old', publishDate: DateTime(2020, 05, 10)),
        Book(title: 'New Book', comment: 'Just released', publishDate: DateTime(2025, 03, 01)),
        Book(title: 'Middle Book', comment: 'Decent', publishDate: DateTime(2022, 08, 15)),
      ];

      books.sort(); // Book 클래스의 compareTo()가 올바르게 작동하는지 확인

      List<String> sortedTitles = books.map((b) => b.title).toList();
      expect(sortedTitles, equals(['New Book', 'Middle Book', 'Old Book'])); // 최신순 정렬 확인
    });

    test('copyWith()을 사용해 기존 객체에서 일부 속성만 변경', () {
      Book original = Book(title: 'Dart Advanced', comment: 'Challenging', publishDate: DateTime(2023, 07, 20));
      Book modified = original.copyWith(comment: 'Updated version');

      expect(modified.title, equals(original.title)); // 제목은 그대로
      expect(modified.publishDate, equals(original.publishDate)); // 출간일도 그대로
      expect(modified.comment, equals('Updated version')); // 코멘트만 변경됨
    });
  });
}