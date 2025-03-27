class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, DateTime? publishDate, required this.comment})
    : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) =>
      other is Book &&
      publishDate.year == other.publishDate.year &&
      publishDate.month == other.publishDate.month &&
      publishDate.day == other.publishDate.day &&
      title == other.title;

  @override
  int get hashCode =>
      publishDate.year.hashCode ^
      publishDate.month.hashCode ^
      publishDate.day.hashCode ^
      title.hashCode;

  @override
  String toString() {
    return 'title: $title, publishData: $publishDate, comment: $comment';
  }

  @override
  int compareTo(Book other) {
    return publishDate.compareTo(other.publishDate) * -1;
  }

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }
}
