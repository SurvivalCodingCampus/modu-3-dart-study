import 'package:test/test.dart';

import '../../assignments/2025_03_21/book.dart';

void main() {
  final book1 = Book(
    title: '제목',
    comment: '코멘트1',
    publishDate: DateTime(2025, 3, 3),
  );
  final book2 = Book(
    title: '제목',
    comment: '코멘트2',
    publishDate: DateTime(2025, 3, 3),
  );
  Book book3 = Book(
    title: '개발',
    comment: '인스턴스',
    publishDate: DateTime(2025, 1, 1),
  );
  Book book4 = Book(
    title: '개발',
    comment: '추상클래스',
    publishDate: DateTime(2025, 1, 2),
  );
  Book book5 = Book(
    title: '개발',
    comment: '인터페이스',
    publishDate: DateTime(2025, 1, 3),
  );

  group('Book', () {
    test('제목과 출간일이 같으면 같은 책이다.', () {
      expect(book1 == book2, isTrue);
    });
    test('신상 출간일 순서대로 정렬', () {
      // 현재값
      final actual = [book4, book3, book5];
      // 예상값
      final expected = [book5, book4, book3];

      // 정렬 후 예상값으로 바뀜
      actual.sort();

      // Test 성공
      expect(actual, expected);
    });
    test('copyWith() 메서드', () {
      // title, comment, publishDate 까지 복사 완료
      Book book3 = book1.copyWith();

      expect(book1 == book3, isTrue);
      print(book3);
    });
  });
}
