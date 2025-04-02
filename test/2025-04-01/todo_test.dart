

import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/model/todo.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/todo_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('[ Todo Model Class ] - ', () {
    test('fromJson() Todo 정확한 객체를 반환해야한다.', () {
      final jsonData = {"userId": 1, "id": 1, "title": "Task 1", "completed": false};
      final todo = Todo.fromJson(jsonData);

      expect(todo.userId, 1);
      expect(todo.id, 1);
      expect(todo.title, "Task 1");
      expect(todo.completed, false);
    });

    test('toJson() 정확한 JSON map을 반환해야한다.', () {
      final todo = Todo(userId: 1, id: 1, title: "Task 1", completed: false);
      final jsonMap = todo.toJson();

      expect(jsonMap["userId"], 1);
      expect(jsonMap["id"], 1);
      expect(jsonMap["title"], "Task 1");
      expect(jsonMap["completed"], false);
    });
  });

  group('[ TodoRepository ] - ', () {
    MockTodoDataSource mockDataSource = MockTodoDataSource();
    TodoRepository repository = TodoRepositoryImpl(mockDataSource);

    test('getTodos() todos 전체 리스트를 반환해야한다.', () async {
      final todos = await repository.getTodos();

      expect(todos.length, 3);
      expect(todos.first.title, "Task 1");
    });

    test('getCompletedTodos() 완료된 todo 리스트를 반환해야한다.', () async {
      final completedTodos = await repository.getCompletedTodos();

      expect(completedTodos.length, 2);
      expect(completedTodos.every((todo) => todo.completed), isTrue);
    });
  });
}