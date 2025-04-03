import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/common/mock/client_mock.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/todo/data_source/impl/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/todo/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/todo/model/todo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/todo/repository/todo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/todo/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

void main() async {
  final mockClient = await ClientMock.mockResp();
  final TodoDataSource dataSource = TodoDataSourceImpl(mockClient);
  final TodoRepository repo = TodoRepositoryImpl(dataSource);
  final mockDataList = [
    {'id': 1, 'title': 'Test Todo 1', 'completed': false},
    {'id': 2, 'title': 'Test Todo 2', 'completed': true},
  ];
  final mockData = {'id': 1, 'title': 'Test Todo 1', 'completed': false};
  group('todo mock test', () {
    test('todo mock data test', () async {
      final todo = await repo.getTodo(1);
      
      expect(todo.toJson(), equals(mockData));
      expect(todo, equals(Todo.fromJson(mockData)));
    });

    test('todo mock data list test', () async {
      final todos = await repo.getTodos();
      
      expect(todos.map((e) => e.toJson()).toList(), equals(mockDataList));
      expect(todos, equals(mockDataList.map((e) => Todo.fromJson(e)).toList()));
    });
  });
}
