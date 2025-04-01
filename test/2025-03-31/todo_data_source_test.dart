import 'dart:convert';

import 'package:test/test.dart';

import '../../assignment/2025-03-31/todo.dart';
import '../../assignment/2025-03-31/todo_data_source.dart';
import '../../assignment/2025-03-31/todo_data_source_impl.dart';

void main() {
  final TodoDataSource todoDataSource = TodoDataSourceImpl();

  group('Todo 테스트', () {
    test('todo 직렬화, 역직렬화가 정상적으로 이뤄져야 한다.', () async {
      final todo = await todoDataSource.getTodo();

      final json = todo.toJson();
      final jsonString = jsonEncode(json);
      final serializationJson = jsonDecode(jsonString);
      final serializationTodo = Todo.fromJson(serializationJson);

      expect(todo, equals(serializationTodo));
    });

    test('todos 직렬화, 역직렬화가 정상적으로 이뤄져야 한다.', () async {
      final todos = await todoDataSource.getTodos();

      final json = todos.map((e) => e.toJson()).toList();
      final jsonString = jsonEncode(json);
      final List<dynamic> deserializationJson = jsonDecode(jsonString);
      final List<Todo> deserializationTodos = deserializationJson.map((e) => Todo.fromJson(e)).toList();

      expect(todos, equals(deserializationTodos));
    });
  });
}
