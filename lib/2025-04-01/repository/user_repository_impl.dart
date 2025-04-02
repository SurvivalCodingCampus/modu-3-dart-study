import 'package:modu_3_dart_study/2025-04-01/repository/user_repository.dart';
import '../data_source/user_data_source.dart';
import '../model/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<List<User>> getUsers() async {
    final userList = await dataSource.getAllUsers();
    return userList
        .map((json) => User.fromJson(json))
        .toList();
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final users = await getUsers();

    users.sort((a, b) => a.username.compareTo(b.username));
    return users.take(10).toList();
  }
}