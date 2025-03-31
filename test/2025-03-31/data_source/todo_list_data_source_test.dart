import 'package:modu_3_dart_study/2025-03-31/data_source/todo_list_data_source.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  group('Todo 리스트 파싱', () {
    test('todo 리스트 파일을 읽어 Todo 객체 목록을 반환해야 한다', () async {
      final dataSource = TodoListDataSourceImpl();
      final todos = await dataSource.getTodos();

      expect(todos, isNotEmpty);
      expect(todos.first.id, equals(1));
      expect(todos.first.title, isNotEmpty);

      // 역직렬화 후 원본과 동일한지 비교
      final jsonString = await File(dataSource.jsonPath).readAsString();
      final jsonList = jsonDecode(jsonString) as List;
      final todosBack = todos.map((e) => e.toJson()).toList();

      expect(todosBack, equals(jsonList));
    });
  });
}
