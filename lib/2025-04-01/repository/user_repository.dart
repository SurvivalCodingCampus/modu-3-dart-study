import '../model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();

  Future<List<User>>  getUsersTop10ByUserName();

}