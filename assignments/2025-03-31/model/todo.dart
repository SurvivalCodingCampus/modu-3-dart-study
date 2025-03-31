class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    final int userId = json['userId'] ?? 0;
    final int id = json['id'] ?? 0;
    final String title = json['title'] ?? '';
    final bool completed = json['completed'] ?? false;

    return Todo(userId: userId, id: id, title: title, completed: completed);
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'completed': completed,
  };
}
