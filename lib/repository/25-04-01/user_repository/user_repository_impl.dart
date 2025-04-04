import 'package:modu_3_dart_study/repository/25-04-01/user_repository/user_repository.dart';
import '../../../data_source/25-04-01/user_data_source/user_data_source.dart';
import '../../../model/25-04-01/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;
  UserRepositoryImpl({required this.dataSource});

  @override
  Future<List<User>> getUsers() async {
    final allUsers = await dataSource.getUsers();
    return allUsers;
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final allUsers = await dataSource.getUsers();
    return allUsers.take(10).toList();
  }
}
