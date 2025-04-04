import 'dtoPr.dart';
import 'todo.dart';

extension TodoMapper on TodoDto {
  Todo toTodo() {
    return Todo(
      id: id?.toInt() ?? -1,
      title: title ?? '제목 없음',
      isDone: completd ?? false,
    );
  }
}
