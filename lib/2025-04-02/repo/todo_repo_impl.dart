
import 'dart:io';
import '../data_source/todo_data_source.dart';
import '../data_source/todo_data_source_impl.dart';
import 'todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  TodoDataSource _todoDataSource;


  TodoRepoImpl(this._todoDataSource);
  @override
  Future<List<Todo>> getTodos() {
    return _todoDataSource.getTodos();
  }

  @override
  Future<void> addTodo(String title) {
    return _todoDataSource.addTodo(title);
  }

  @override
  Future<void> updateTodo(int id, String newTitle) {
    return _todoDataSource.updateTodo(id, newTitle);
  }

  @override
  Future<void> toggleTodo(int id) {
    return _todoDataSource.toggleTodo(id);
  }

  @override
  Future<void> deleteTodo(int id) {
    return _todoDataSource.deleteTodo(id);
  }
}