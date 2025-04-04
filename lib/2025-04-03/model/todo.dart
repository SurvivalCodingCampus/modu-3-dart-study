import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable(explicitToJson: true) // 복잡한 구조로 된 애들까지 해결 옵션
class Todo {
  final int id;
  final String title;
  final bool completed;

  const Todo({
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, completed: $completed}';
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}