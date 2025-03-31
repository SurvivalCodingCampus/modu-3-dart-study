import '../model/users/user.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}
