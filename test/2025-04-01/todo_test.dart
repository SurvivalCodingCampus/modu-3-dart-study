import 'package:collection/collection.dart';
import 'package:test/test.dart';

import 'package:modu_3_dart_study/2025-04-01/model/todo.dart';

void main() {
  const List<Map<String, dynamic>> mockTodos = [
    {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
  ];

  group('Todos 테스트', () {
    test('직렬화, 역직렬화 테스트', () {
      final todos = mockTodos.map((e) => Todo.fromJson(e)).toList();
      final jsonList = todos.map((e) => e.toJson()).toList();
      final deserializationTodos =
          jsonList.map((e) => Todo.fromJson(e)).toList();

      expect(ListEquality().equals(todos, deserializationTodos), isTrue);
      expect(
        todos[0].title.isNotEmpty,
        equals(deserializationTodos[0].title.isNotEmpty),
      );
    });
  });
}
