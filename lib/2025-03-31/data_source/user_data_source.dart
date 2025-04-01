import 'dart:convert';
import 'dart:io';
import '../models/user.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}

class UserDataSourceImpl implements UserDataSource {
  final String jsonPath;

  UserDataSourceImpl({this.jsonPath = 'lib/2025-03-31/data/users.json'});

  @override
  Future<List<User>> getUsers() async {
    try {
      final jsonString = await File(jsonPath).readAsString();
      final jsonList = jsonDecode(jsonString) as List;
      final users = jsonList.map((e) => User.fromJson(e)).toList();

      return users;
    } catch (e) {
      print('getUsers 실패: \$e');
      return [];
    }
  }
}
