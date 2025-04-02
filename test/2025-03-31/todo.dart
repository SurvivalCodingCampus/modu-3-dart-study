import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/model/todo.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  test('1. getTodo', () async {
    final file = File('lib/2025-03-31/data_source/todo.json');
    final jsonString = await file.readAsString();

    final dataString = TodoDataSourceImpl(
      jsonString: jsonString,
      jsonList: '[]',
      jsonUser: '[]',
    );

    final todo = await dataString.getTodo();

    expect(todo, isA<Todo>());
    expect(todo.userId, 1);
    expect(todo.id, 1);
    expect(todo.title, equals('delectus aut autem'));
    expect(todo.completed, isFalse);
  });
}
