import '../../model/user/user.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}
