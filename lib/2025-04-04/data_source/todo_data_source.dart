import 'package:modu_3_dart_study/2025-04-04/dto/todo_dto.dart';

abstract interface class TodoDataSource {
  Future<List<TodoDto>> getTodos();
  Future<TodoDto> getTodo(int id);
}
