import 'package:test/test.dart';

import '../../assignments/2025-03-31/data_source/impl/todo_data_source_impl.dart';
import '../../assignments/2025-03-31/data_source/todo_data_source.dart';
import '../../assignments/2025-03-31/model/todo.dart';

void main() {
  const String fileName = 'todo.json';
  const String listFileName = 'todos.json';
  const String wrongFileName = 'todo2.json';
  const int todoUserId = 1;
  const int todoId = 1;
  const String todoTitle = 'delectus aut autem';
  const bool todoCompleted = false;
  final TodoDataSource todoDataSource = TodoDataSourceImpl();

  group('투두 : ', () {
    test('todo.json 파일 받아오기', () async {
      Todo todo = await todoDataSource.getTodoFromFile(fileName);

      expect(todo, isA<Todo>());
      expect(todo.userId, equals(todoUserId));
      expect(todo.id, equals(todoId));
      expect(todo.title, equals(todoTitle));
      expect(todo.completed, equals(todoCompleted));
    });
    test('todo.json 파일 받아오기 실패', () async {
      expect(
        () async => await todoDataSource.getTodoFromFile(wrongFileName),
        throwsA(isArgumentError),
      );
    });
    test('todos.json 파일로 list 데이터 받아오기', () async {
      List<Todo> todo = await todoDataSource.getTodosFromFile(listFileName);

      expect(todo, isA<List<Todo>>());
      expect(todo.length, equals(200));
    });
    test('todos.json 파일로 list 데이터 받아오기 실패', () async {
      expect(
        () async => await todoDataSource.getTodosFromFile(wrongFileName),
        throwsA(isArgumentError),
      );
    });
  });
}
