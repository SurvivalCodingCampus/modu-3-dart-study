import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-03-21/solution.dart';

void main() {
  group('Book', () {
    test('제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다', () {
      Book book1 = Book(
        title: '오준석의 생존코딩',
        comment: 'comment',
        publishDate: DateTime(2024, 1, 1, 9, 30), // 오전 9시 30분
      );

      Book book2 = Book(
        title: '오준석의 생존코딩',
        comment: 'comment 22222',
        publishDate: DateTime(2024, 1, 1, 18, 30), // 오후 6시 30분
      );

      Book book3 = Book(
        title: '오준석의 생존코딩 - 플러터',
        comment: 'comment 22222',
        publishDate: DateTime(2024, 1, 1, 18, 30), // 오후 6시 30분
      );

      Book book4 = Book(
        title: '오준석의 생존코딩',
        comment: 'comment 22222',
        publishDate: DateTime(2024, 1, 2),
      );

      expect(book1 == book2, isTrue, reason: '제목이 같고 년,월,일이 같으면 같은 책 (시분초 무시)');
      expect(book1 == book3, isFalse, reason: '년월일이 같아도 제목이 다르면 다른 책');
      expect(book1 == book4, isFalse, reason: '출간일이 다르면 다른 책');

      final Set<Book> books = {book1, book2, book3, book4};

      expect(books.length == 3, isTrue);
    });

    test('Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다.', () {
      Book book1 = Book(
        title: 'book1',
        comment: 'comment 22222',
        publishDate: DateTime(2024, 1, 1, 2),
      );

      Book book2 = Book(
        title: 'book2',
        comment: 'comment 22222',
        publishDate: DateTime(2024, 1, 1, 1),
      );

      Book book3 = Book(
        title: 'book3',
        comment: 'comment 22222',
        publishDate: DateTime(2024, 1, 3),
      );

      // 예측 값
      final List<Book> expected = [book3, book1, book2];

      // 실제 값
      final List<Book> original = [book1, book2, book3];
      original.sort(); // 원본을 섞는다

      // 문제
      expect(original, expected);
    });

    test('copyWith() 로 복사', () {
      final Book originalBook = Book(
        title: '원본',
        comment: '원본 코멘트',
        publishDate: DateTime(2024, 1, 3, 1, 1, 1),
      );

      final copiedBook = originalBook.copyWith();

      expect(copiedBook.title, '원본');
      expect(copiedBook.comment, '원본 코멘트');
      expect(copiedBook.publishDate, DateTime(2024, 1, 3, 1, 1, 1));

      final copiedBook2 = originalBook.copyWith(
        publishDate: DateTime(2024, 2, 3),
      );

      expect(copiedBook2.title, '원본');
      expect(copiedBook2.comment, '원본 코멘트');
      expect(copiedBook2.publishDate, DateTime(2024, 2, 3));
    });
  });
}
