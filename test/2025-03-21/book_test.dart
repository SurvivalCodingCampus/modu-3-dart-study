import 'package:test/test.dart';

import '../../assignments/2025-03-21/book.dart';

void main() {
  test('제목과 출간일이 같으면 같은책!', () {
    //given
    final Book book1 = Book(
      title: 'book1',
      comment: 'comment1',
      publishDate: DateTime(2025, 3, 1),
    );
    final Book book2 = Book(
      title: 'book1',
      comment: 'comment2',
      publishDate: DateTime(2025, 3, 1),
    );
    final Book book3 = Book(
      title: 'book3',
      comment: 'comment3',
      publishDate: DateTime(2025, 3, 3),
    );

    //when, then
    expect(book1.hashCode, equals(book2.hashCode));
    expect(book1, equals(book2));

    expect(book1.hashCode == book3.hashCode, equals(false));
    expect(book1 == book3, equals(false));
  });

  test('sort로 신상부터 정렬', () {
    //given
    final Book book1 = Book(
      title: '가장 오래된 책',
      comment: 'comment1',
      publishDate: DateTime(2024, 1, 1),
    );
    final Book book2 = Book(
      title: '중간 책',
      comment: 'comment2',
      publishDate: DateTime(2025, 3, 10),
    );
    final Book book3 = Book(
      title: '가장 신간',
      comment: 'comment3',
      publishDate: DateTime(2025, 3, 20),
    );
    List<Book> bookList = [book1, book2, book3];

    //when
    print('정렬하기 전 : $bookList');
    bookList.sort();
    print('정렬한 후 : $bookList');

    //then
    expect(bookList, equals([book3, book2, book1]));
  });

  test('copyWith 테스트', () {
    //given
    final Book book1 = Book(
      title: 'book1',
      comment: 'comment1',
      publishDate: DateTime(2025, 3, 1),
    );

    final book2 = book1.copyWith();

    //then
    expect(book1, equals(book2));
  });
}

// 오늘 과제한게 어제 풀리퀘스트로 들어가버려서 주석만 추가
