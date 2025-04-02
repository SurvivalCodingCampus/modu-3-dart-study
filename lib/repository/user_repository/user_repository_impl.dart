import 'package:modu_3_dart_study/model/User.dart';
import 'package:modu_3_dart_study/repository/user_repository/user_repository.dart';

import '../../data_source/user_data_source/user_data_source.dart';

class UserRepositoryImpl implements UserRepository{
  final UserDataSource dataSource;
  UserRepositoryImpl({required this.dataSource});

  @override
  Future<List<User>> getUsers() async{
    final allUsers = await dataSource.getUsers();
    return allUsers;
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async{
    final allUsers = await dataSource.getUsers();
    return allUsers.take(10).toList();
  }

}