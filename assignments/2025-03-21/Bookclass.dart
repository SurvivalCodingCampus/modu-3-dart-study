import 'package:collection/collection.dart';

class Book {
  final String title;
  final DateTime publishDate;
  final String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate.year == other.publishDate.year &&
          publishDate.month == other.publishDate.month &&
          publishDate.day == other.publishDate.day;

  @override
  int get hashCode =>
      title.hashCode ^
      publishDate.year.hashCode ^
      publishDate.month.hashCode ^
      publishDate.day.hashCode;

  @override
  String toString() =>
      'Book(title: $title, publishDate: $publishDate, comment: $comment)';
}

//제목과 출간일이 같으면 같은 책 -> set ,  List는 comment까지 같이 정의를 해줘야 같은 책이 될 수 있음
//Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다.
//copyWith() 메서드를 제공한다.
//깊은 복사 기능도 추가한다.
void main() {
  Set<Book> books = {
    Book(
      title: '죄와벌',
      comment: 'Comment 1',
      publishDate: DateTime(2002, 12, 1),
    ),
    Book(
      title: '채식주의자',
      comment: 'Comment 2',
      publishDate: DateTime(2022, 4, 1),
    ),
    Book(
      title: '혜성의 냄새',
      comment: 'Comment 3',
      publishDate: DateTime(2023, 1, 1),
    ),
    Book(
      title: '오만과 편견',
      comment: 'Comment 4',
      publishDate: DateTime(2002, 12, 1),
    ),
    Book(
      title: '죄와벌',
      comment: 'Comment 5',
      publishDate: DateTime(2002, 12, 1),
    ),
    Book(
      title: '채식주의자',
      comment: 'Comment 6',
      publishDate: DateTime(2022, 4, 1),
    ),
    Book(title: '지능의 기원', comment: 'Comment 7'),
    Book(title: '지능의 기원', comment: 'Comment 8'),
  };

  final bookListByTitle = books.sorted(
    (a, b) => a.publishDate.compareTo(b.publishDate) * -1,
  );
  print(bookListByTitle);

  print('-------------------------------');

  final book1 = Book(
    title: 'book1',
    comment: 'Comment 1',
    publishDate: DateTime(2002, 12, 1),
  );
  final bookBundle = {
    book1,
    book1.copyWith(title: 'book2'),
    book1.copyWith(title: 'book3', comment: 'Comment 3'),
    book1.copyWith(title: 'book4', publishDate: DateTime(2023, 1, 1)),
    book1.copyWith(
      title: 'book5',
      comment: 'Comment 5',
      publishDate: DateTime(2022, 4, 1),
    ),
    book1.copyWith(
      title: 'book1',
      comment: 'Comment 6',
      publishDate: DateTime(2002, 12, 1),
    ),
  };

  final byPublishDate = bookBundle.sorted(
    (a, b) => b.publishDate.compareTo(a.publishDate),
  );

  print(byPublishDate);
}
