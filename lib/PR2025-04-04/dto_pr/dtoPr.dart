//nullable로 DTO 클래스 생성

class TodoDto {
  final num? userId;
  final num? id;
  final String? title;
  final bool? completd;

  TodoDto({this.userId, this.id, this.title, this.completd});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completd': completd};
  }

  factory TodoDto.fromJson(Map<String, dynamic> json) {
    return TodoDto(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completd: json['completd'],
    );
  }
}
