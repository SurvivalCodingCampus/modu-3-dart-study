import 'package:collection/collection.dart';

import '../data_source/user_data_source.dart';
import '../model/user.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  const UserRepositoryImpl({required UserDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<User>> getUsers() async {
    List<Map<String, dynamic>> jsonMap = await _dataSource.getAllUsers();
    List<User> allUsers = jsonMap.map((e) => User.fromMap(e)).toList();
    return allUsers;
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    List<Map<String, dynamic>> jsonMap = await _dataSource.getAllUsers();
    List<User> allUsers = jsonMap.map((e) => User.fromMap(e)).toList();
    final sortedUsers = allUsers.sorted((a, b) => a.name.compareTo(b.name));
    return sortedUsers.sublist(0,sortedUsers.length > 10 ? 10 : sortedUsers.length);
  }
}
