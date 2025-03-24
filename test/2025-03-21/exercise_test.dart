import 'package:modu_3_dart_study/2025-03-21/exercise.dart';
import 'package:test/test.dart';

void main() {
  Book book1 = Book(
    title: '한국책',
    comment: '댓글1',
    publishDate: DateTime(2024, 01, 01),
  );

  Book book2 = Book(
    title: '한국책',
    comment: '댓글2',
    publishDate: DateTime(2024, 01, 01),
  );

  Book book3 = Book(
    title: '미국책',
    comment: '댓글3',
    publishDate: DateTime(2023, 03, 13),
  );

  Book book4 = Book(
    title: '중국책',
    comment: '댓글4',
    publishDate: DateTime(2021, 12, 25),
  );

  final books = [book1, book2, book3, book4];

  final byPublishDate =
  books.toList()..sort((a, b) => a.publishDate.compareTo(b.publishDate));

  Book bookCopy = book1.copyWith();


  group('book test', () {
    test('출간일 동일', () {
      expect(book2 == book1, true);
    });

    test('출간일 sort', () {
      expect(byPublishDate[0].publishDate, DateTime(2021, 12, 25));
      expect(byPublishDate[1].publishDate, DateTime(2023, 03, 13));
      expect(byPublishDate[2].publishDate, DateTime(2024, 01, 01));
      expect(byPublishDate[3].publishDate, DateTime(2024, 01, 01));
    });

    test('copyWith',(){
      expect(bookCopy.publishDate, book1.publishDate);
      expect(identical(bookCopy, book1), false);
    });
  });
}
