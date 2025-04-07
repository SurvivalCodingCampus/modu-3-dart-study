import 'package:modu_3_dart_study/2025-04-04/dto/todo_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/model/todo.dart';

extension TodoMapper on TodoDto {
  Todo toTodo() {
    return Todo(
      userId: userId?.toInt() ?? -1,
      id: id?.toInt() ?? -1,
      title: title ?? '제목없음',
      completed: completed ?? false,
    );
  }
}
