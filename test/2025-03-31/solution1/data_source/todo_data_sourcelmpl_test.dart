import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/solution1/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/solution1/model/todo.dart';
import 'package:test/test.dart';

void main() async {
  test('1.TodoListget', () async {
    String todoJsonText =
        File(
          'lib/2025-03-31/solution1/data_source/todo.json',
        ).readAsStringSync();
    Map<String, dynamic> todoJson = jsonDecode(todoJsonText);

    TodoDataSourceImpl tododatasourcelmpl = TodoDataSourceImpl();
    Todo getInfo = await tododatasourcelmpl.getTodo();

    expect(getInfo.title, todoJson["title"]);
    expect(getInfo.completed, todoJson["completed"]);
  });
}
