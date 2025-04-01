import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/data_source/user_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/model/stock_listing.dart';
import 'package:modu_3_dart_study/2025-03-31/model/todo.dart';
import 'package:modu_3_dart_study/2025-03-31/model/user.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  test('과제1 Todo 테스트', () async {
    final File file = File('lib/2025-03-31/todo.json');
    final String fileString = file.readAsStringSync();
    final Map<String, dynamic> json = jsonDecode(fileString); // 다이나믹으로 밖에 안받아짐.

    final Todo todo = await TodoDataSourceImpl().getTodo();

    expect(todo.userId, json['userId']);
    expect(todo.title, json['title']);
    expect(todo.completed, json['completed']);
    expect(todo.id, json['id']);
  });
  test('과제2 Todos 테스트', () async {
    final File file = File('lib/2025-03-31/todos.json');
    final String fileString = file.readAsStringSync();
    final List<dynamic> jsonList  = jsonDecode(fileString); // 다이나믹으로 밖에 안받아짐.

    final List<Todo> todos = await TodoDataSourceImpl().getTodos();

    for (int i = 0; i < todos.length; i++) {
      expect(todos[i].userId, jsonList[i]['userId']);
      expect(todos[i].id, jsonList[i]['id']);
      expect(todos[i].completed, jsonList[i]['completed']);
      expect(todos[i].title, jsonList[i]['title']);
    }
  });
}
