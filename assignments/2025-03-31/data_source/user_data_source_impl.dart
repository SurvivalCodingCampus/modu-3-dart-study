import 'dart:io';
import 'dart:convert';
import '../model/user.dart';
import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    final file = File('flutter-study/assignments/2025-03-31/data_source/users.json');
    String jsonString = await file.readAsString();

    // Parse JSON string to Map
    List<dynamic> jsonList = jsonDecode(jsonString);

    // Create Todo object from JSON
    return User.fromJsonList(jsonList);
  }
}