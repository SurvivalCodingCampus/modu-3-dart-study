import 'dart:convert';

import '../2025-03-25/default_file_operations.dart';
import '../2025-03-25/file_operation.dart';
import 'user.dart';
import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  static const usersPath = 'assignment/2025-03-31/users.json';

  final FileOperation _fileOperation;

  FileOperation get fileOperation => _fileOperation;

  UserDataSourceImpl({FileOperation? fileOperation})
    : _fileOperation = fileOperation ?? DefaultFileOperations();

  @override
  Future<List<User>> getUsers() async {
    final jsonString = await fileOperation.readAsync(usersPath);
    final List<dynamic> decodedJson = jsonDecode(jsonString);
    final List<User> users = decodedJson.map((e) => User.fromJson(e)).toList();
    return users;
  }
}
