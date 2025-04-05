//DTO가 담는 모델 TO,FROM JSON 없어도 됨

import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  final int id;
  final String title;
  final bool isDone;

  const Todo({required this.id, required this.title, required this.isDone});
}
