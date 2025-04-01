class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    final userId = json['userId'] as int;
    final id = json['id'] as int;
    final title = json['title'] as String;
    final completed = json['completed'] as bool;
    return Todo(userId: userId, id: id, title: title, completed: completed);
  }
}
