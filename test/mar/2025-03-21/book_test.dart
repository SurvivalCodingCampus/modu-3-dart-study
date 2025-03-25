import 'package:collection/collection.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-21/book.dart';

void main() {
  //제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다
  test('책이란', () {
    Book book = Book(
      title: '해리포터',
      comment: '마돌',
      publishDate: DateTime(2024, 01, 01),
    );
    Book book2 = Book(
      title: '해리포터',
      comment: '비방',
      publishDate: DateTime(2024, 01, 01),
    );

    expect(book == book2, isTrue);
  });

  // Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다
  test('책이란2', () {
    Book book = Book(title: '해리포터', comment: '마돌');
    Book book2 = Book(title: '해리포터', comment: '비방');
    Book book3 = Book(
      title: '해리포터',
      comment: '아죄',
      publishDate: DateTime(2025),
    );
    Book book4 = Book(
      title: '해리포터',
      comment: '불잔',
      publishDate: DateTime(2016, 11, 15),
    );
    Book book5 = Book(
      title: '해리포터',
      comment: '불기',
      publishDate: DateTime(2018),
    );
    Book book6 = Book(
      title: '해리포터',
      comment: '혼왕',
      publishDate: DateTime(2018, 1, 1),
    );
    Book book7 = Book(
      title: '해리포터',
      comment: '죽성',
      publishDate: DateTime(2018, 12, 31),
    );

    List<Book> hp = <Book>[book, book2, book3, book4, book5, book6, book7];

    // final sortedHp = hp.sorted(
    //   (a, b) => b.publishDate.compareTo(a.publishDate),
    // );
    final sortedHp = hp.sorted();
    // Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다
    expect(
      sortedHp,
      equals([
        Book(title: '해리포터', comment: '비방', publishDate: book2.publishDate),
        Book(title: '해리포터', comment: '마돌', publishDate: book.publishDate),
        Book(title: '해리포터', comment: '아죄', publishDate: DateTime(2025)),
        Book(title: '해리포터', comment: '죽성', publishDate: DateTime(2018, 12, 31)),
        Book(title: '해리포터', comment: '혼왕', publishDate: DateTime(2018, 1, 1)),
        Book(title: '해리포터', comment: '불기', publishDate: DateTime(2018, 1, 1)),
        Book(title: '해리포터', comment: '불잔', publishDate: DateTime(2016, 11, 15)),
      ]),
    );
  });
  //copyWith() 메서드를 제공한다
  test('책이란3', () {
    Book book = Book(
      title: '해리포터',
      comment: '마돌',
      publishDate: DateTime(2024, 01, 01),
    );
    final book2 = book;

    Book bookCopy = book.copyWith();

    expect(identical(book, book2), isTrue);
    expect(identical(book, bookCopy), isFalse);
  });
}
