class Book {
  final String title;
  final DateTime _publishDate;
  final String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : _publishDate = publishDate ?? DateTime.now();

  DateTime get publishDate =>
      DateTime(_publishDate.year, _publishDate.month, _publishDate.day);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? _publishDate,
      comment: comment ?? this.comment,
    );
  }
}
