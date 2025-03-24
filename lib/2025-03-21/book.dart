class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    int? year,
    int? month,
    int? day,
  }) : publishDate = DateTime(
         year ?? DateTime.now().year,
         month ?? DateTime.now().month,
         day ?? DateTime.now().day,
       );

  // 동등성 비교 규칙 재정의
  @override
  bool operator ==(Object other) {
    // 동일한 객체 참조일 경우 같음
    if (identical(this, other)) return true;

    return other is Book &&
        other.title == title &&
        other.publishDate == publishDate &&
        other.runtimeType == runtimeType;
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  // Comparable 오버라이드하여 출간일을 최신 기준으로 정렬
  @override
  int compareTo(Book other) {
    return other.publishDate.compareTo(publishDate); // 내림차순으로 비교
  }

  // 복사
  Book copyWith({
    String? title,
    int? year, // year만 받도록 변경
    int? month, // month만 받도록 변경
    int? day, // day만 받도록 변경
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      // publishDate는 년, 월, 일만으로 새로 생성
      year: year ?? publishDate.year,
      month: month ?? publishDate.month,
      day: day ?? publishDate.day,
    );
  }
}
