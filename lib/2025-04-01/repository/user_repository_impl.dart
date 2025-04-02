import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/repository/user_repository.dart';

import '../model/user.dart';

class UserRepositoryImpl implements UserRepository {
  File file = File('lib/2025-04-01/remote/user.json');


  @override
  Future<List<User>> getUsers() async {
    String jsonString = await file.readAsString();
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<User> users = jsonList.map((json) =>
        User.fromJson(json as Map<String, dynamic>)).toList();
    return users;
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
     String jsonString = await file.readAsString();
     List<dynamic> jsonList = jsonDecode(jsonString);
     List<User> users = jsonList.map((json) => User.fromJson(json as Map<String, dynamic>))
     .toList();

     users.sort((a, b) => b.name.length.compareTo(a.name.length));
     final top10ByUserName = users.take(10).toList();
     return top10ByUserName;
  }
}