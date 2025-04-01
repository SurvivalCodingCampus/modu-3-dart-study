import 'package:modu_3_dart_study/PR2025-04-01/users/model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsersTop10ByUserName();
}
