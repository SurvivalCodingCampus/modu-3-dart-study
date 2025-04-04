import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  Todo copyWith({int? userId, int? id, String? title, String? body}) {
    return Todo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  String toString() {
    return 'Todo(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
