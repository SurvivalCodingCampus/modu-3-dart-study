import 'package:collection/collection.dart';

import '../data_source/user_data_source.dart';
import '../model/user.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() async {
    final users = await _userDataSource.getUsers();

    return users.map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final users = await _userDataSource.getUsers();

    return users
        .map((e) => User.fromJson(e))
        .toList()
        .sorted((a, b) => a.username.compareTo(b.username));
  }
}
