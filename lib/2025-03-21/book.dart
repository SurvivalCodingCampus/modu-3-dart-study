class Book implements Comparable<Book> {
  final String title;
  final DateTime publishDate;
  final String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) {
    if (other is Book) {
      final bool sameYear = publishDate.year == other.publishDate.year;
      final bool sameMonth = publishDate.month == other.publishDate.month;
      final bool sameDay = publishDate.day == other.publishDate.day;

      return title == other.title && (sameYear && sameMonth && sameDay);
    }

    return false;
  }

  @override
  int get hashCode =>
      Object.hash(title, publishDate.year, publishDate.month, publishDate.day);

  @override
  int compareTo(Book other) {
    int dateComparison = publishDate.compareTo(other.publishDate);
    if (dateComparison != 0) return dateComparison;
    return title.compareTo(other.title);
  }

  Book copyWith({String? title, String? comment, DateTime? publishDate}) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }
}
