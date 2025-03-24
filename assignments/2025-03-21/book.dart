class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  Book copywith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }

  @override
  int compareTo(Book other) {
    return -publishDate.compareTo(other.publishDate);
  }

  @override
  int get hashCode {
    return title.hashCode ^ publishDate.year.hashCode ^ publishDate.month.hashCode ^ publishDate.day.hashCode;
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
  String toString() {
    return "title: $title, publishDate: $publishDate";
  }
}
