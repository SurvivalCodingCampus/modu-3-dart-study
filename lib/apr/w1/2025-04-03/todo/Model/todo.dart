class Todo {
  final int id;
  final String title;
  final bool completed;

  const Todo(this.id, this.title, this.completed);

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, completed: $completed}';
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

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(json['id'], json['title'], json['completed']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'completed': completed,
  };
}
