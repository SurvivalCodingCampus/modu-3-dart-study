import '../../utils/json_convertible.dart';

class Todo implements JsonConvertible<Todo, bool> {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo({int? userId, int? id, String? title, bool? completed})
    : userId = userId ?? 0,
      id = id ?? 0,
      title = title ?? '',
      completed = completed ?? false;

  factory Todo.fromJson(Map<String, dynamic> json) {
    final int userId = json['userId'] ?? 0;
    final int id = json['id'] ?? 0;
    final String title = json['title'] ?? '';
    final bool completed = json['completed'] ?? false;

    return Todo(userId: userId, id: id, title: title, completed: completed);
  }

  @override
  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'completed': completed,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }

  @override
  // TODO: implement filterKey
  bool get filterKey => completed;

  @override
  Todo fromJson(Map<String, dynamic> json) {
    return Todo.fromJson(json);
  }
}
