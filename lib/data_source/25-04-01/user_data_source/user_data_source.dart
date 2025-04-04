import '../../../model/25-04-01/user.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}
