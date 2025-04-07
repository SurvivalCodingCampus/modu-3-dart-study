import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable(explicitToJson: true)
class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo(this.id, this.title, this.completed);

  Todo copyWith({int? id, String? title, bool? completed}) {
    return Todo(
      id ?? this.id,
      title ?? this.title,
      completed ?? this.completed,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          completed == other.completed;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ completed.hashCode;

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, completed: $completed)';
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
