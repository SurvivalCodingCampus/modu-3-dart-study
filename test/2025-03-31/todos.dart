import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/model/todo.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  test('2. getTodos', () async {
    final file = File('lib/2025-03-31/data/get_todos.json');
    final jsonList = await file.readAsString();

    final dataString = TodoDataSourceImpl(
      jsonString: '[]',
      jsonList: jsonList,
      jsonUser: '[]',
    );

    final getTodos = await dataString.getTodos();

    expect(getTodos, isA<List<Todo>>());
    expect(getTodos.length, greaterThan(0));
    expect(getTodos.first.title, isNotEmpty);
    expect(getTodos.first.completed, isA<bool>());
  });
}
