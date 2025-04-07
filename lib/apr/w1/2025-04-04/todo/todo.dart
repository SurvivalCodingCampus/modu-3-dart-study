import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  final int id;
  final String title;
  final bool isDone;

  const Todo({required this.id, required this.title, required this.isDone});


}
