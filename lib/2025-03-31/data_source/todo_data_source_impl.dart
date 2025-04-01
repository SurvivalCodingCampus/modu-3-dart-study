import 'dart:convert';
import '../model/todo.dart';
import 'todo_data_source.dart';
import '../model/user.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String jsonString;
  final String jsonList;
  final String jsonUser;

  TodoDataSourceImpl({
    required this.jsonString,
    required this.jsonList,
    required this.jsonUser,
  });

  @override
  Future<Todo> getTodo() async {
    try {
      final Map<String, dynamic> json = jsonDecode(jsonString);
      return Todo.fromJson(json);
    } catch (e) {
      throw Exception('Todo JSON 파싱 오류: $e');
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final List<dynamic> jsonStrings = jsonDecode(jsonList);

      final todos =
          jsonStrings.map((json) {
            return Todo.fromJson(json as Map<String, dynamic>);
          }).toList();

      return todos;
    } catch (e) {
      throw Exception('Todos JSON 파싱 오류: $e');
    }
  }

  @override
  Future<List<User>> getUsers() async {
    final List<dynamic> jsonUsers = jsonDecode(jsonUser);
    final users =
        jsonUsers.map((json) {
          return User.fromJson(json as Map<String, dynamic>);
        }).toList();

    return users;
  }
}
