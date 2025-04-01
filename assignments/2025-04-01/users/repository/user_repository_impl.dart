import 'package:modu_3_dart_study/PR2025-04-01/users/data_source/users_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-01/users/model/user.dart';
import 'package:modu_3_dart_study/PR2025-04-01/users/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    UsersDataSource usersDataSource = UsersDataSource();
    List<User> allUserDatas = await usersDataSource.getUsers();
    List<User> top10UserName =
        allUserDatas.toList()..sort((a, b) => a.username.compareTo(b.username));
    return top10UserName;
  }
}
