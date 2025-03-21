class Book {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
      : publishDate = publishDate ?? DateTime.now();

  Book copyWith({
    String? name,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: name ?? this.title,
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
              publishDate == other.publishDate;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate, comment: $comment}';
  }
}
