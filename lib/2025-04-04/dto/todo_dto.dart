import 'package:modu_3_dart_study/2025-04-04/model/todo.dart';

class TodoDto {
  final num? userId;
  final num? id;
  final String? title;
  final bool? completed;

  TodoDto({this.userId, this.id, this.title, this.completed});

  // JSON 데이터를 객체로 변환하는 factory 생성자
  factory TodoDto.fromJson(Map<String, dynamic> json) {
    return TodoDto(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  // 객체를 JSON 형식으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }
}
