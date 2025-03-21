import 'package:intl/intl.dart';

class Book {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate =
          publishDate ??
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          );

  //other is Book으로 Book타입이 보장되기때문에 runtimeType안써도 괜찮음
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  //set과 Map을 사용할때 필요한 것이기때문에 지금 코드에선 필요 없음
  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  String toString() {
    return 'title: $title, comment: $comment, publishDate: ${DateFormat('yyyy-MM-dd').format(publishDate)}';
  }

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }
}
