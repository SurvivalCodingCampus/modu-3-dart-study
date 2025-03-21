// ignore_for_file: public_member_api_docs, sort_constructors_first
class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
      title: title ?? this.title,
      publishDate: this.publishDate,
      comment: comment ?? this.comment,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Book &&
            runtimeType == other.runtimeType &&
            title == other.title &&
            publishDate == other.publishDate; // title과 publishDate가 일치하면 동등
  }

  @override
  int compareTo(Book other) {
    // 출간일이 나중인 것부터 출력
    if (publishDate == other.publishDate) {
      return 0;
    }
    if (publishDate.isBefore(other.publishDate)) {
      return 1;
    }

    return -1;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Book(title: $title, publishDate: $publishDate, comment: $comment)';
  }
}

void main() {
  Book book1 = Book(
    title: 'title',
    comment: 'comment',
    publishDate: DateTime(2025, 3, 20),
  );
  Book book2 = Book(
    title: 'title',
    comment: 'comment',
    publishDate: DateTime(2025, 3, 21, 17, 30),
  );
  Book book3 = Book(
    title: 'title',
    comment: 'comment',
    publishDate: DateTime(2025, 3, 21, 18),
  );

  List<Book> books = [book1, book2, book3];

  books.sort();
  print(books);
  print(book1 == book2);
}
