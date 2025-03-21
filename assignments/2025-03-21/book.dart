class Book implements Comparable {
  String title;
  DateTime publishDate;
  String comment;

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Book &&
            title == other.title &&
            publishDate == other.publishDate);
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  int compareTo(other) {
    return other.publishDate.compareTo(publishDate);
  }

  @override
  String toString() {
    return 'Book title : $title, publishDate : $publishDate';
  }
}
