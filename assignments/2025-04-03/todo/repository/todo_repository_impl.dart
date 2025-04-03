import 'package:collection/collection.dart';

import '../data_source/todo_data_source.dart';

import '../model/todo.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl({required TodoDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<Todo> fetchTodo(int id) async {
    return await _dataSource.getTodo(id);
  }

  @override
  Future<List<Todo>> fetchTodos() async {
    return await _dataSource.getTodos();
  }

  @override
  Future<void> addTodo(String title) async {
    try {
      List<Todo> todoList = await getTodos();

      final newTodo = Todo(
        id: todoList.last.id + 1,
        title: title,
        completed: false,
      );

      todoList.add(newTodo);

      await _dataSource.writeTodos(todoList.map((e) => e.toJson()).toList());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteTodo(int id) async {
    try {
      List<Todo> todoList = await getTodos();

      await _dataSource.writeTodos(
        todoList.where((e) => e.id != id).map((e) => e.toJson()).toList(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final List<Map<String, dynamic>> todosJson =
          await _dataSource.readTodos();

      return todosJson
          .map((e) => Todo.fromJson(e))
          .toList()
          .sorted((a, b) => a.id.compareTo(b.id));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> toggleTodo(int id) async {
    try {
      List<Todo> todoList = await getTodos();

      await _dataSource.writeTodos(
        todoList.map((e) {
          if (e.id == id) {
            return e.copyWith(completed: !e.completed).toJson();
          }
          return e.toJson();
        }).toList(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateTodo(int id, String newTitle) async {
    try {
      List<Todo> todoList = await getTodos();

      await _dataSource.writeTodos(
        todoList.map((e) {
          if (e.id == id) {
            return e.copyWith(title: newTitle).toJson();
          }
          return e.toJson();
        }).toList(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Todo>> selectedWithCompletedTodo(bool completed) async {
    try {
      List<Todo> todoList = await getTodos();

      // writeLogs('Completed가 ${completed}인 할일 목록: ');

      return todoList
          .where((element) => element.completed == completed)
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
