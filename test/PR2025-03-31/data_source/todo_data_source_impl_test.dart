import 'dart:convert';
import 'dart:math';

import 'package:modu_3_dart_study/PR2025-03-31/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/PR2025-03-31/model/todo.dart';
import 'package:test/test.dart';

void main() {
  const userId = 1;
  const id = 1;
  const title = 'delectus aut autem';
  const completed = false;

  test('todo.json 확인', () async {
    final dataSource = TodoDataSourceImpl();
    final todo = await dataSource.getTodo();
    
    expect(todo, isA<Todo>());
    expect(todo.userId, equals(userId));
    expect(todo.id, equals(id));
    expect(todo.title, equals(title));
    expect(todo.completed, equals(completed));
  });
}
