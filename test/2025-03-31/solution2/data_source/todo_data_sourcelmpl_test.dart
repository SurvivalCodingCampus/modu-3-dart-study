import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/solution2/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/solution2/model/todo.dart';
import 'package:test/test.dart';

void main() async {
  test('2.get List<Todo>', () async {
    String todoListJsonText =
        File(
          'lib/2025-03-31/solution2/data_source/todos.json',
        ).readAsStringSync();

    List todoListConvert = jsonDecode(todoListJsonText);

    TodoDataSourceImpl tododatasourcelmpl = TodoDataSourceImpl();

    List<Todo> getListTodo = await tododatasourcelmpl.getTodos();

    for (int i = 0; i < getListTodo.length; i++) {
      expect(getListTodo[i].title, todoListConvert[i]["title"]);
      expect(getListTodo[i].completed, todoListConvert[i]["completed"]);
    }
  });
}
