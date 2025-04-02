class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completd;

  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completd,
  });

  Todo copyWith({int? userId, int? id, String? title, bool? completd}) {
    if ((userId == null || identical(userId, this.userId)) &&
        (id == null || identical(id, this.id)) &&
        (title == null || identical(title, this.title)) &&
        (completd == null || identical(completd, this.completd))) {
      return this;
    }

    return Todo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completd: completd ?? this.completd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'id': this.id,
      'title': this.title,
      'completd': this.completd,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completd: map['completed'] as bool,
    );
  }

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completd: $completd}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          completd == other.completd;

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ completd.hashCode;
}
