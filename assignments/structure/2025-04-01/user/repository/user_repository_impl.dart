import '../data_source/user_data_source.dart';
import '../model/user_model.dart';
import 'user_repository.dart';
import 'package:collection/collection.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<List<User>> getUsers() async {
    final resp = await _dataSource.getUsers();
    final users = resp.map((e) => User.fromJson(e)).toList();
    return users;
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final users = await getUsers();
    final top10Users = users.sorted((a, b) => a.name.compareTo(b.name)).sublist(0, 10);
    return top10Users;
  }
}