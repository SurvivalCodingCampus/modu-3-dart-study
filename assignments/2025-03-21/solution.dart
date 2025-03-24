import 'package:intl/intl.dart';

class Book implements Comparable<Book> {
  String title;
  final DateTime _publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : _publishDate = publishDate ?? DateTime.now();

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? _publishDate,
      comment: comment ?? this.comment,
    );
  }

  String get publishDate => DateFormat('yyyy-MM-dd').format(_publishDate);

  @override
  int compareTo(Book other) {
    return _publishDate.compareTo(other._publishDate);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        other.title == title &&
        other.publishDate == publishDate;
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  String toString() =>
      'Book(title: $title, publishDate: $publishDate, comment: $comment)';
}

void main() {
  Book book1 = Book(
    title: '생존코딩2',
    comment: 'flutter',
    publishDate: DateTime(2024, 1, 1),
  );
  Book book2 = Book(
    title: '생존코딩1',
    comment: 'flutter',
    publishDate: DateTime(2023, 1, 1),
  );

  Book book3 = Book(
    title: '생존코딩3',
    comment: 'flutter',
    publishDate: DateTime(2025, 1, 1),
  );
  Book book4 = Book(
    title: '생존코딩3',
    comment: 'flutter',
    publishDate: DateTime(2025, 1, 1),
  );

  print(book3 == book4); // true
  print(book3.hashCode);
  print(book4.hashCode);

  List<Book> bookList = [book1, book2, book3, book4];

  bookList.sort();
  print(bookList);

  Book book5 = book1.copyWith(title: '새로운 책 제목');
  print(book5);
}
