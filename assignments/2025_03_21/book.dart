class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, DateTime? publishDate, required this.comment})
    : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) =>
      other is Book && publishDate == other.publishDate && title == other.title;

  @override
  int get hashCode => publishDate.hashCode;

  @override
  String toString() {
    return 'title: $title, publishData: $publishDate, comment: $comment';
  }

  @override
  int compareTo(Book other) {
    return publishDate.compareTo(other.publishDate);
  }

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(title: title ?? this.title, comment: comment ?? this.comment);
  }
}
