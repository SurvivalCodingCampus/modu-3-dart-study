import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/2025-04-01/solution4/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution4/model/user.dart';
import 'package:modu_3_dart_study/2025-04-01/solution4/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() async {
    final userList = await _userDataSource.getUsers();
    return userList
        .map((e) => User.fromJson(e))
        .toList();
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final userList = await _userDataSource.getUsers();
    return userList
        .map((e) => User.fromJson(e))
        .sorted((a, b) => a.username.compareTo(b.username))
        .take(10)
        .toList();
  }
}