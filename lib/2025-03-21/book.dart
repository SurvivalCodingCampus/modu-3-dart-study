class Book {
  // 캡슐화를 위해서 변수앞에 final을 사용. Set 막아주고 getter 만 제공
  final String title;
  final String comment;

  final DateTime _publishDate;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate})
      : _publishDate = publishDate ?? DateTime.now();

  DateTime get publishDate => DateTime(_publishDate.year, _publishDate.month, _publishDate.day);

  @override
  String toString() {
    return 'Book{title: $title, _publishDate: $_publishDate, comment: $comment}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          _publishDate == other._publishDate;

  @override
  int get hashCode => title.hashCode ^ _publishDate.hashCode;

  // copyWith 메서드 구현
  Book copyWith({String? title, String? comment, DateTime? publishDate}) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? _publishDate,
    );
  }
}

