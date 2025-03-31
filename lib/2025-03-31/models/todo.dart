class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.userId,
    required this.title,
    bool complete = false,
  }) : completed = complete;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
      complete: json['completed'],
    );
  }

  @override
  String toString() =>
      'Todo(id: $id, userId: $userId, title: $title, completed: $completed)';
}
