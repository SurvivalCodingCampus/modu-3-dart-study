class TodoDto {
  final num? userId;
  final num? id;
  final String? title;
  final bool? completed;

  TodoDto({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  // JSON에서 객체로 변환하는 factory constructor
  factory TodoDto.fromJson(Map<String, dynamic> json) {
    return TodoDto(
      userId: json['userId'] as num?,
      id: json['id'] as num?,
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );
  }

  // 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}