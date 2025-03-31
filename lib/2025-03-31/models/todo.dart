class Todo {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  Todo({this.userId, this.id, this.title, this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (userId != null) json['userId'] = userId;
    if (id != null) json['id'] = id;
    if (title != null) json['title'] = title;
    if (completed != null) json['completed'] = completed;
    return json;
  }

  void debugPrint() {
    print(
      'Todo { userId: $userId, id: $id, title: $title, completed: $completed }',
    );
    print('========================================');
  }
}
