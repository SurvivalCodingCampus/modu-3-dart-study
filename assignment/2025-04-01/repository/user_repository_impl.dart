import 'package:collection/collection.dart';

import '../data_source/local/user_data_source_impl.dart';
import '../data_source/user_data_source.dart';
import '../model/user.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({UserDataSource? userDataSource})
    : _userDataSource = userDataSource ?? UserDataSourceImpl();

  @override
  Future<List<User>> getUsers() async {
    const path = 'assignment/2025-04-01/assets/users.json';
    final json = await _userDataSource.fetchUsers(path);
    return json.map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    const path = 'assignment/2025-04-01/assets/users.json';
    final json = await _userDataSource.fetchUsers(path);
    return json
        .map((e) => User.fromJson(e))
        .sorted((a, b) => a.username.compareTo(b.username))
        .take(10)
        .toList();
  }
}
