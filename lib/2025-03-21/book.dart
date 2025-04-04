import 'package:collection/collection.dart';

class Book {
  String title;
  DateTime publishDate;
  String command;

  Book({required this.title, required this.command, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  Book copyWith({String? title, DateTime? publishDate, String? command}) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      command: command ?? this.command,
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
}
